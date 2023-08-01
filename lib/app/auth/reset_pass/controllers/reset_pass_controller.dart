import 'package:flutter/material.dart';
import 'package:flutter_new_template/app/auth/change_pass/views/change_pass_view.dart';
import 'package:flutter_new_template/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../../repos/auth_repo.dart';
import '../../change_pass/controllers/change_pass_controller.dart';

class ResetPassController extends GetxController {
  TextEditingController mailTextController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  final AuthRepository repository = AuthRepositoryImp();

  Future<void> resetPass() async {
    if (formKey.currentState!.validate()) {
      Get.toNamed(Routes.CHANGE_PASS);
    }
  }

  @override
  void dispose() {
    mailTextController.dispose();
    super.dispose();
  }
}
