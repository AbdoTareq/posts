import 'package:flutter_new_template/models/post.dart';
import '../../../../../export.dart';

class FavoritesController extends GetxController with StateMixin<List<Post>> {
  GetStorage box = GetStorage();

  @override
  Future<void> onReady() async {
    await handleRequestWithoutLoading(() async {
      change([], status: RxStatus.loading());
      getFavorites();
    }, onError: (e) => change([], status: RxStatus.error(e.message)));
    super.onReady();
  }

  List<Post> getFavorites() {
    if (box.hasData(kFavorites)) {
      final List<Post> temp = postsFromJson(box.read(kFavorites));
      change(temp,
          status: temp.isEmpty ? RxStatus.empty() : RxStatus.success());
    } else
      change([], status: RxStatus.empty());
    return state!;
  }

  addToFavorite(Post post) async {
    final temp = {...state!, post};
    if (temp.length > state!.length) {
      change(temp.toList(), status: RxStatus.success());
      await box.write(kFavorites, postsToJson(temp.toList()));
    }
  }

  removeFavorite(Post post) async {
    final temp =
        state!.filter((element) => element.title != post.title).toList();
    change(temp, status: RxStatus.success());
    await box.write(kFavorites, postsToJson(temp));
  }
}
