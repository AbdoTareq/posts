import 'package:flutter_new_template/network/endpoints.dart';

import '../export.dart' hide ar;

abstract class PostsRepository {
  Future<Either<Failure, ServerResponse>> getAll(
      {int? pageNum, int? limit, int? timeout, bool? refreshFromServer});
}

class PostsRepositoryImp with BaseRequests implements PostsRepository {
  PostsRepositoryImp._privateConstructor();

  static final PostsRepositoryImp _instance =
      PostsRepositoryImp._privateConstructor();

  factory PostsRepositoryImp() {
    return _instance;
  }

  Future<Either<Failure, ServerResponse>> getAll(
          {int? pageNum,
          int? limit,
          int? timeout,
          bool? refreshFromServer}) async =>
      baseGet(
          '$postsEndpoint/?_start=${pageNum ?? 0}&_limit=${limit ?? pageLimit}',
          timeout: timeout,
          refreshFromServer: refreshFromServer ?? false);
}
