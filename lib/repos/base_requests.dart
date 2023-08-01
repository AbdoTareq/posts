import '../export.dart';

class BaseRequests {
  GetStorage box = GetStorage();

  Future<Either<Failure, ServerResponse>> baseGet(
    String endPoint, {
    String? baseUrl,
    String? cashName,
    bool refreshFromServer = false,
    int? timeout,
  }) async {
    try {
      if (box.hasData(cashName.toString()) && !refreshFromServer) {
        return Right(ServerResponse.fromJson(box.read(cashName.toString())));
      } else {
        Network network = Network(endPoint: endPoint, timeout: timeout);
        var res = await network.get();
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
