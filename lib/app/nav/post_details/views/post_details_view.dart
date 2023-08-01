import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/post_details_controller.dart';

class PostDetailsView extends GetView<PostDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PostDetailsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PostDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
