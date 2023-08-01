import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/posts_controller.dart';

class PostsView extends GetView<PostsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PostsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PostsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
