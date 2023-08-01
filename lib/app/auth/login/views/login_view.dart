import 'package:flutter_new_template/app/routes/app_pages.dart';
import 'package:flutter_new_template/view/widgets/rounded_corner_loading_button.dart';

import '../../../../export.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: controller.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextInput(
            autofillHints: [AutofillHints.email],
            controller: controller.mailTextController,
            borderColor: Colors.white,
            inputType: TextInputType.emailAddress,
            hint: mail,
            prefixIcon: Icon(Icons.email, color: Colors.white),
            validate: (value) => GetUtils.isEmail(value!) ? null : mail.tr,
          ),
          20.heightBox,
          PasswordInput(
            controller: controller.passTextController,
            hint: pass,
          ),
          forgetPass.tr.text.end.white.bold.make().p2().wFull(context).onTap(() {
            Get.toNamed(Routes.RESET_PASS);
          }),
          20.heightBox,
          RoundedCornerLoadingButton(
            color: kSecondaryColor,
            onPressed: () async => await controller.login(),
            child: login.tr.text.white.bold.xl.make().p8(),
          ).wFull(context),
          20.heightBox,
          // ? make it Get.off instead of to solve GlobalKey duplicate  problem
          dontHaveAccount.tr.text.white.bold.makeCentered().p2().onTap(() {
            Get.toNamed(Routes.SIGNUP);
          }),
        ],
      ).pSymmetric(h: 16).backgroundColor(kPrimaryColor),
    ));
  }
}
