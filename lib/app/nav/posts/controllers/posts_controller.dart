import 'package:flutter_new_template/app/nav/favorites/controllers/favorites_controller.dart';
import 'package:flutter_new_template/models/post.dart';
import 'package:flutter_new_template/repos/posts_repo.dart';

import '../../../../../export.dart';

class PostsController extends GetxController with StateMixin<List<Post>> {
  final PostsRepository repo = PostsRepositoryImp();
  ScrollController scrollController = ScrollController();
  int _pageNum = 0;
  List<RxBool> isFavoriteList = <RxBool>[];
  final FavoritesController favoriteController = Get.put(FavoritesController());

  @override
  Future<void> onReady() async {
    await handleRequestWithoutLoading(() async {
      change([], status: RxStatus.loading());
      await _getPosts();
    }, onError: (e) => change([], status: RxStatus.error(e.message)));
    _getMoreListener();
    super.onReady();
  }

  _getPosts() async {
    final res = await repo.getAll(pageNum: _pageNum);
    var temp = state!;
    res.fold((_) {}, (r) {
      r.data.forEach((v) {
        Post post = Post.fromJson(v);
        temp.add(post);
        isFavoriteList.add(false.obs);
      });
      change(temp, status: RxStatus.success());
    });
  }

  void _getMoreListener() {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        _pageNum += pageLimit;
        await handleRequest(() async {
          await _getPosts();
        });
      }
    });
  }

  refreshFromServer() async {
    _pageNum = 0;
    await _getPosts();
  }
}
