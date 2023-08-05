import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

List<Post> postsFromJson(List<dynamic> list) =>
    List<Post>.from(list.map((x) => Post.fromJson(x)));

String postsToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  int userId;
  int id;
  String title;
  String body;
  RxBool isFavorite;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
    required this.isFavorite,
  });

  Post copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
    RxBool? isFavorite,
  }) {
    return Post(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory Post.fromJson(Map<String, dynamic> map) {
    return Post(
      userId: (map['userId'] ?? 0) as int,
      id: (map['id'] ?? 0) as int,
      title: (map['title'] ?? '') as String,
      body: (map['body'] ?? '') as String,
      isFavorite: (map['isFavorite'] ?? false.obs) as RxBool,
    );
  }

  @override
  String toString() {
    return 'Post(userId: $userId, id: $id, title: $title, body: $body)';
  }
}
