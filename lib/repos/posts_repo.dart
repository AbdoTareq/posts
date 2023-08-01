import 'package:flutter_new_template/network/endpoints.dart';

import '../export.dart' hide ar;

abstract class PostsRepository {
  Future<Either<Failure, ServerResponse>> getAll(
      {int? pageNum, int? timeout, bool? refreshFromServer});
}

class PostsRepositoryImp implements PostsRepository {
  PostsRepositoryImp._privateConstructor();

  static final PostsRepositoryImp _instance =
      PostsRepositoryImp._privateConstructor();

  factory PostsRepositoryImp() {
    return _instance;
  }

  Future<Either<Failure, ServerResponse>> getAll(
      {int? pageNum, int? timeout, bool? refreshFromServer}) async {
    try {
      Network network = Network(
          endPoint: '$postsEndpoint/?_start=${pageNum ?? 0}&_limit=$pageLimit',
          timeout: timeout);
      var res = await network.get();
      return Right(ServerResponse.fromJson({"data": res.data}));
    } catch (e) {
      return Left(Failure(message: e.toString()).handleNetworkError(e));
    }
  }
}
