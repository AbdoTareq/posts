import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as http;
import 'package:requests_inspector/requests_inspector.dart';

import '../export.dart' hide MultipartFile;

final _baseUrl = 'https://jsonplaceholder.typicode.com/';

class Network {
  final String endPoint;
  final dynamic body;
  final int? timeout;

  // good practice to make one connection to server available to the app as we don't want to create a new connection every time we make server call

  Network({required this.endPoint, this.body, this.timeout});
  GetStorage box = GetStorage();
  final dio = Dio(BaseOptions(validateStatus: (_) => true))
    ..interceptors.add(RequestsInspectorInterceptor());

  Map<String, String?> headers = {
    'Accept': 'application/json',
    'locale': Get.locale?.languageCode ?? 'en',
    "Keep-Alive": "timeout=12",
    'Authorization': GetStorage().hasData("token")
        ? 'Bearer ${GetStorage().read("token")}'
        : null,
  };

  Future<http.Response> req(
      Future<http.Response> Function() requestType) async {
    dio.options.connectTimeout = timeout ?? 100 * 1000;
    dio.options.receiveTimeout = timeout ?? 100 * 1000;
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

  Future<http.Response> get() {
    return req(() {
      return dio.get(_baseUrl + endPoint, options: Options(headers: headers));
    });
  }
}
