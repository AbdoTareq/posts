import 'package:flutter/material.dart';
import 'package:flutter_new_template/app/home/controllers/home_controller.dart';
import 'package:flutter_new_template/view/widgets/app_drawer.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('HomePage')),
        drawer: AppDrawer(),
        body: SafeArea(child: Text('HomeController')));
  }
}
