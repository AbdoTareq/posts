import '../export.dart' hide ar;

abstract class PostsRepository {
  Future<Either<Failure, ServerResponse>> get(
      {int? pageNum, int? limit, int? timeout, bool? refreshFromServer});
}

class PostsRepositoryImp with BaseRequests implements PostsRepository {
  PostsRepositoryImp._privateConstructor();

  static final PostsRepositoryImp _instance =
      PostsRepositoryImp._privateConstructor();

  factory PostsRepositoryImp() {
    return _instance;
  }

  Future<Either<Failure, ServerResponse>> get(
          {int? pageNum,
          int? limit,
          int? timeout,
          bool? refreshFromServer}) async =>
      baseGet('/?_start=${pageNum ?? 0}&_limit=${limit ?? 10}',
          timeout: timeout, refreshFromServer: refreshFromServer ?? false);
}
