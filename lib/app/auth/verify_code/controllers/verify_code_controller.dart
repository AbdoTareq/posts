import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyCodeController extends GetxController {
  TextEditingController verifyTextController = TextEditingController();

  Future<void> verify() async {}

  @override
  void dispose() {
    super.dispose();
    verifyTextController.dispose();
  }
}
