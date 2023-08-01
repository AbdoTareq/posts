import 'package:flutter/material.dart';
import 'package:flutter_new_template/repos/auth_repo.dart';
import 'package:get/get.dart';

class ChangePassController extends GetxController {
  TextEditingController passTextController = TextEditingController();
  TextEditingController confirmTextController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  final AuthRepository repository = AuthRepositoryImp();

  Future<void> changePass() async {
    if (formKey.currentState!.validate()) {
      Get.until((route) => route.isFirst);
    }
  }

  @override
  void dispose() {
    super.dispose();
    confirmTextController.dispose();
  }
}
