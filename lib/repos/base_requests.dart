import 'dart:io';

import '../export.dart';

class BaseRequests {
  GetStorage box = GetStorage();
  Future<Either<Failure, ServerResponse>> basePost(String endPoint, dynamic body,
      {String? baseUrl, bool isBevatel = false}) async {
    Network network = Network(endPoint: endPoint, body: body);
    try {
      var res = await network.post(baseUrl: baseUrl, isBevatel: isBevatel);
      try {
        return Right(ServerResponse.fromJson(res.data));
      } catch (e) {
        return Right(ServerResponse(data: res.data));
      }
    } on Exception catch (e) {
      return Left(Failure(message: e.toString()).handleNetworkError(e));
    }
  }

  Future<Either<Failure, dynamic>> basePostGeneral(String endPoint, dynamic body, {String? baseUrl}) async {
    Network network = Network(endPoint: endPoint, body: body);
    try {
      var res = await network.post(baseUrl: baseUrl);
      return Right(res.data);
    } on Exception catch (e) {
      return Left(Failure(message: e.toString()).handleNetworkError(e));
    }
  }

  Future<Either<Failure, ServerResponse>> baseUpload(
      String endPoint, File file, Map<String, dynamic> user) async {
    Network network = Network(endPoint: endPoint);
    try {
      var res = await network.uploadImage(file, user);
      return Right(ServerResponse.fromJson(res.data));
    } on Exception catch (e) {
      return Left(Failure(message: e.toString()).handleNetworkError(e));
    }
  }

  Future<Either<Failure, ServerResponse>> basePut(String endPoint, Map<String, dynamic> body) async {
    Network network = Network(endPoint: endPoint, body: body);
    try {
      var res = await network.put();
      return Right(ServerResponse.fromJson(res.data));
    } on Exception catch (e) {
      return Left(Failure(message: e.toString()).handleNetworkError(e));
    }
  }

  Future<Either<Failure, ServerResponse>> baseDelete(String endPoint, Map<String, dynamic> body) async {
    Network network = Network(endPoint: endPoint, body: body);
    try {
      var res = await network.delete();
      return Right(ServerResponse.fromJson(res.data));
    } on Exception catch (e) {
      return Left(Failure(message: e.toString()).handleNetworkError(e));
    }
  }

  Future<Either<Failure, ServerResponse>> baseGet(
    String endPoint, {
    String? baseUrl,
    String? cashName,
    bool refreshFromServer = false,
    bool isBevatel = false,
    dynamic body,
  }) async {
    try {
      if (box.hasData(cashName.toString()) && !refreshFromServer) {
        return Right(ServerResponse.fromJson(box.read(cashName.toString())));
      } else {
        Network network = Network(endPoint: endPoint, body: isBevatel ? body : null);
        var res = await network.get(baseUrl: baseUrl, isBevatel: isBevatel);
        if (cashName != null) {
          if (res.data != null) {
            if (res.data.runtimeType == List) {
              if ((res.data as List).isNotEmpty) {
                box.write(cashName, res.data);
              }
            } else
              box.write(cashName, res.data);
          }
        }
        return Right(ServerResponse.fromJson(res.data));
      }
    } catch (e) {
      return Left(Failure(message: e.toString()).handleNetworkError(e));
    }
  }
}
