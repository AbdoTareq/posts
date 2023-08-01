import 'package:flutter_new_template/models/post.dart';
import 'package:flutter_new_template/repos/posts_repo.dart';

import '../../../../../export.dart';

class PostsController extends GetxController with StateMixin<List<Post>> {
  final PostsRepository repo = PostsRepositoryImp();
  ScrollController scrollController = ScrollController();
  int pageNum = 0;

  @override
  Future<void> onReady() async {
    await handleRequestWithoutLoading(() async {
      change([], status: RxStatus.loading());
      await getPosts();
    }, onError: (e) => change([], status: RxStatus.error()));
    getMoreListener();
    super.onReady();
  }

  getPosts() async {
    final res = await repo.getAll(pageNum: pageNum);
    var temp = state!;
    res.fold((_) {}, (r) {
      r.data.forEach((v) {
        temp.add(new Post.fromJson(v));
      });

      change(temp, status: RxStatus.success());
    });
  }

  void getMoreListener() {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        pageNum += pageLimit;
        await handleRequest(() async {
          await getPosts();
        });
      }
    });
  }
}
