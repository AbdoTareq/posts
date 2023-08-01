import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:requests_inspector/requests_inspector.dart';

import '../export.dart' hide MultipartFile;

final _baseUrl = 'https://backend.eradonline.murabba.dev/api';

class Network {
  final String endPoint;
  final dynamic body;

  // good practice to make one connection to server available to the app as we don't want to create a new connection every time we make server call

  Network({required this.endPoint, this.body});
  GetStorage box = GetStorage();
  final dio =
      Dio(BaseOptions(connectTimeout: 100 * 1000, receiveTimeout: 100 * 1000, validateStatus: (_) => true))
        ..interceptors.add(RequestsInspectorInterceptor());

  Map<String, String?> headers = {
    'Accept': 'application/json',
    'locale': Get.locale?.languageCode ?? 'en',
    "Keep-Alive": "timeout=12",
    'Authorization': GetStorage().hasData("token") ? 'Bearer ${GetStorage().read("token")}' : null,
  };

  Future<http.Response> req(Future<http.Response> Function() requestType) async {
    try {
      final response = await requestType();

      if (response.statusCode! > 210 || response.statusCode! < 200) {
        throw Failure(message: response.data.toString());
      }
      // success
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        // logger.i(e.response!.data);
        throw Failure(message: e.response!.data.toString());
      } else {
        logger.i(e.message);
        throw Failure(message: e.message.toString());
      }
    } on Exception catch (e) {
      throw Failure(message: '').handleNetworkError(e);
    } catch (e) {
      throw Failure(message: '').handleNetworkError(e);
    }
  }

  String _getParamsFromBody() {
    String params = '';
    for (var i = 0; i < body?.keys.length; i++) {
      params += '${List.from(body?.keys)[i]}=${List.from(body?.values)[i]}';
      if (i != body!.keys.length - 1) {
        params += '&';
      }
    }
    return params;
  }

  Future<http.Response> post({bool isParamData = false, String? baseUrl, bool isBevatel = false}) async {
    return req(() {
      return dio.post((baseUrl ?? _baseUrl) + endPoint + (isParamData ? _getParamsFromBody() : ''),
          data: isParamData ? {} : body, options: Options(headers: headers));
    });
  }

  Future<http.Response> put() {
    return req(() {
      return dio.put(_baseUrl + endPoint, data: body, options: Options(headers: headers));
    });
  }

  Future<http.Response> delete() {
    return req(() {
      return dio.delete(_baseUrl + endPoint, data: body, options: Options(headers: headers));
    });
  }

  Future<http.Response> get({String? baseUrl, bool isBevatel = false}) {
    return req(() {
      return dio.get((baseUrl ?? _baseUrl) + endPoint + (isBevatel ? _getParamsFromBody() : ''),
          options: Options(headers: headers));
    });
  }

  Future<http.Response> uploadImage(File file, Map<String, dynamic> user,
      {MultipartFile? multipartFile}) async {
    http.FormData formData;
    if (kIsWeb) {
      formData = http.FormData.fromMap({
        "upload": multipartFile,
      });
    } else {
      String fileName = file.path.split('/').last;
      formData = http.FormData.fromMap(
          {"file": await http.MultipartFile.fromFile(file.path, filename: fileName), ...user});
    }
    return req(() {
      return dio.post(_baseUrl + endPoint, data: formData, options: Options(headers: headers));
    });
  }

  downloadFileFromUrl(String url, String savePath) async {
    try {
      await dio.download(url, savePath, onReceiveProgress: (received, total) {});
      print("File is saved to download folder.");
    } on DioError catch (e) {
      showWarningDialog(text: e.message);
    }
  }
}
