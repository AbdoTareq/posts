import 'package:flutter_new_template/export.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_new_template/app/nav/favorites/controllers/favorites_controller.dart';
import 'package:flutter_new_template/models/post.dart';
import 'package:mockito/mockito.dart';

void main() {
  group('FavoritesController', () {
    late FavoritesController favoritesController;
    late GetStorage mockGetStorage;

    setUp(() {
      favoritesController = FavoritesController();
      mockGetStorage = GetStorage();
      favoritesController.box = mockGetStorage;
    });

    test('Get favorites from storage', () async {
      // Mock data
      final mockFavorites = [
        {
          'title': 'Post 1',
          'body': 'Post body 1',
          'id': 1,
          'isFavorite': false.obs,
          'userId': 1
        },
        {
          'title': 'Post 2',
          'body': 'Post body 2',
          'id': 2,
          'isFavorite': false.obs,
          'userId': 1
        },
      ];

      // Set up mock storage response
      when(mockGetStorage.hasData(kFavorites)).thenReturn(true);
      when(mockGetStorage.read(kFavorites)).thenReturn(mockFavorites);

      // Invoke onReady method
      await favoritesController.onReady();

      // Verify that the favorites are fetched correctly
      expect(favoritesController.state!.length, 2);
      expect(favoritesController.state![0].title, 'Post 1');
      expect(favoritesController.state![1].title, 'Post 2');
    });

    test('Add to favorites and update storage', () async {
      // Set up mock post
      final mockPost = Post(
          title: 'Post 3',
          body: 'Post body 3',
          id: 3,
          isFavorite: false.obs,
          userId: 1);

      // Set up mock state and storage
      favoritesController.change([], status: RxStatus.empty());

      // Invoke addToFavorite method
      await favoritesController.addToFavorite(mockPost);

      // Verify that the post is added to favorites and storage is updated
      expect(favoritesController.state!.length, 1);
      expect(favoritesController.state![0].title, 'Post 3');
      verify(mockGetStorage.write(kFavorites, any)).called(1);
    });

    test('Remove from favorites and update storage', () async {
      // Set up mock post
      final mockPost = Post(
          title: 'Post 1',
          body: 'Post body 1',
          id: 1,
          isFavorite: false.obs,
          userId: 1);

      // Set up mock state and storage
      favoritesController.change([
        Post(
            title: 'Post 1',
            body: 'Post body 1',
            id: 1,
            isFavorite: false.obs,
            userId: 1),
        Post(
            title: 'Post 2',
            body: 'Post body 2',
            id: 2,
            isFavorite: false.obs,
            userId: 1),
      ], status: RxStatus.success());

      // Invoke removeFavorite method
      await favoritesController.removeFavorite(mockPost);

      // Verify that the post is removed from favorites and storage is updated
      expect(favoritesController.state!.length, 1);
      expect(favoritesController.state![0].title, 'Post 2');
      verify(mockGetStorage.write(kFavorites, any)).called(1);
    });
  });
}
