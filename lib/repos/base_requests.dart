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
        return Right(ServerResponse.fromJson({"data": res.data}));
      }
    } catch (e) {
      return Left(Failure(message: e.toString()).handleNetworkError(e));
    }
  }
}
