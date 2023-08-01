import 'package:flutter_new_template/repos/auth_repo.dart';

import '../../../../export.dart';

class SignupController extends GetxController {
  final AuthRepositoryImp repository = AuthRepositoryImp();

  final storage = GetStorage();
  final GlobalKey<FormState> formKey = GlobalKey();

  List<TextEditingController> textControllers = List.generate(5, (index) => TextEditingController());
  List<String> choices = ['client'.tr, 'merchant'.tr];
  var chosen = ''.obs;

  Future<void> signup() async {
    if (formKey.currentState!.validate()) {
      if (chosen.value.isEmpty) return showWarningDialog(text: "برجاء اختيار نوع الحساب");
      var user = {
        "name": textControllers[0].text,
        "phone": textControllers[1].text,
        "email": textControllers[2].text,
        "password": textControllers[3].text,
        "password_confirmation": textControllers[3].text,
        "type": chosen.value == "client".tr ? "client" : "merchant",
      };
      await handleRequest(() async {
        final response = await repository.login(user);
        response.fold((_) {}, (r) {
          logger.i(r.data);
          storage.write('token', r.data["token"]);
          Get.offAllNamed(Routes.NAV);
        });
      });
    }
  }

  @override
  void onClose() {
    for (var item in textControllers) {
      item.clear();
    }
    super.onClose();
  }
}
