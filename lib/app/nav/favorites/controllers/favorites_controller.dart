import 'package:flutter_new_template/app/nav/posts/controllers/posts_controller.dart';
import 'package:flutter_new_template/models/post.dart';

import '../../../../../export.dart';

class FavoritesController extends GetxController with StateMixin<List<Post>> {
  GetStorage box = GetStorage();
  final PostsController postsController = Get.put(PostsController());

  @override
  Future<void> onReady() async {
    await handleRequestWithoutLoading(() async {
      change([], status: RxStatus.loading());
      _getFavorites(box.read(kFavorites));
      box.listenKey(kFavorites, (value) {
        _getFavorites(value);
      });
    }, onError: (e) => change([], status: RxStatus.error(e.message)));
    super.onReady();
  }

  void _getFavorites(value) {
    final List<Post> temp = postsFromJson(value);
    change(temp, status: RxStatus.success());
  }

  removeFavorite(int index) async {
    List<Post> favorites = postsFromJson(box.read(kFavorites));
    var temp = favorites[index];
    favorites.removeAt(index);
    await box.write(kFavorites, postsToJson(favorites));
    int index2 = postsController.state!
        .indexWhere((element) => element.title == temp.title);
    postsController.isFavoriteList.removeAt(index2);
  }
}
