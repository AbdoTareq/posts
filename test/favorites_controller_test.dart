import 'package:flutter_new_template/app/nav/favorites/controllers/favorites_controller.dart';
import 'package:flutter_new_template/app/nav/posts/controllers/posts_controller.dart';
import 'package:flutter_new_template/export.dart';
import 'package:flutter_new_template/models/post.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('FavoritesController adds a post to favorites correctly', () {
    FavoritesController controller = Get.put(FavoritesController());
    controller.onReady();
    final post = Post(
        title: 'Post 1',
        body: 'Post body 1',
        id: 1,
        isFavorite: false.obs,
        userId: 1);

    controller.addToFavorite(post);

    expect(controller.state!.length, 1);
    expect(controller.state![0].title, 'Post 1');
  });

  test('FavoritesController removes a post from favorites correctly', () {
    FavoritesController controller = Get.put(FavoritesController());
    PostsController postsController = Get.put(PostsController());
    postsController.onReady();
    controller.onReady();
    final post = Post(
        title: 'Post 1',
        body: 'Post body 1',
        id: 1,
        isFavorite: false.obs,
        userId: 1);

    controller.addToFavorite(post);
    controller.removeFavorite(post);

    expect(controller.state?.isEmpty, true);
  });

  test(
      'FavoritesController getFavorites returns empty list if no favorites exist',
      () {
    FavoritesController controller = Get.put(FavoritesController());
    controller.onReady();

    expect(controller.state!.isEmpty, true);
  });

  test('FavoritesController getFavorites returns list of favorites', () {
    FavoritesController controller = Get.put(FavoritesController());
    controller.onReady();

    final post1 = Post(
        title: 'Post 1',
        body: 'Post body 1',
        id: 1,
        isFavorite: false.obs,
        userId: 1);
    final post2 = Post(
        title: 'Post 2',
        body: 'Post body 2',
        id: 2,
        isFavorite: false.obs,
        userId: 1);

    controller.addToFavorite(post1);
    controller.addToFavorite(post2);

    expect(controller.state!.length, 2);
    expect(controller.state![0].title, 'Post 1');
    expect(controller.state![1].title, 'Post 2');
  });
}
