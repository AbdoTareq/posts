import 'package:flutter_new_template/app/nav/favorites/controllers/favorites_controller.dart';
import 'package:flutter_new_template/models/post.dart';
import 'package:flutter_new_template/repos/posts_repo.dart';

import '../../../../../export.dart';

class PostsController extends GetxController with StateMixin<List<Post>> {
  final PostsRepository repo = PostsRepositoryImp();
  ScrollController scrollController = ScrollController();
  int _pageNum = 0;
  final FavoritesController favoriteController = Get.put(FavoritesController());

  @override
  Future<void> onReady() async {
    await handleRequestWithoutLoading(() async {
      change([], status: RxStatus.loading());
      await _getPosts();
    }, onError: (e) => change([], status: RxStatus.error(e.toString())));
    _getMoreListener();
    super.onReady();
  }

  _getPosts() async {
    final res = await repo.getAll(pageNum: _pageNum);
    res.fold((_) {}, (r) {
      change([...state!, ...postsFromJson(r.data)], status: RxStatus.success());
    });
    applyFavoritesOnPosts();
  }

  applyFavoritesOnPosts() {
    for (var element in state!) {
      element.isFavorite(false);
    }
    final favorites = favoriteController.state;
    favorites!.forEach((fav) {
      int index = state!.indexWhere((element) => fav.title == element.title);
      if (index != -1) {
        state![index].isFavorite(true);
        change(state, status: RxStatus.success());
      }
    });
  }

  toggleFavorite(Post post) {
    !post.isFavorite.value
        ? favoriteController.addToFavorite(post)
        : favoriteController.removeFavorite(post);
    post.isFavorite.toggle();
    applyFavoritesOnPosts();
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
