import 'package:flutter_new_template/app/auth/signup/controllers/signup_controller.dart';

import '../../../../export.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: controller.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextInput(
            autofillHints: [AutofillHints.name],
            controller: controller.textControllers[0],
            borderColor: Colors.white,
            hint: fullName,
            prefixIcon: Icon(Icons.person, color: Colors.white),
            validate: (value) => value!.isNotEmpty ? null : 'mail is wrong',
          ),
          TextInput(
            autofillHints: [AutofillHints.telephoneNumber],
            controller: controller.textControllers[1],
            borderColor: Colors.white,
            hint: phone,
            inputType: TextInputType.phone,
            prefixIcon: Icon(Icons.phone, color: Colors.white),
            validate: (value) => value!.isNotEmpty ? null : 'mail is wrong',
          ),
          TextInput(
            autofillHints: [AutofillHints.email],
            controller: controller.textControllers[2],
            borderColor: Colors.white,
            hint: mail,
            prefixIcon: Icon(Icons.mail, color: Colors.white),
            validate: (value) => GetUtils.isEmail(value!) ? null : 'mail is wrong',
          ),
          TextInput(
            controller: controller.textControllers[3],
            borderColor: Colors.white,
            hint: pass,
            inputType: TextInputType.visiblePassword,
            prefixIcon: Icon(Icons.lock, color: Colors.white),
            validate: (value) => GetUtils.isGreaterThan(value!.length, 5)
                ? null
                : 'يجب أن يكون طول النص كلمة السر أكبر 6 حروفٍ/حرفًا',
          ),
          Obx(
            () => CustomDropdownButton2(
              hint: selectItem.tr,
              dropdownWidth: Get.width - 32,
              buttonHeight: 60,
              dropdownItems: controller.choices,
              buttonDecoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              value: controller.chosen.value.isEmpty ? null : controller.chosen.value.tr,
              onChanged: (value) {
                controller.chosen(value);
              },
            ),
          ).wFull(context),
          20.heightBox,
          RoundedCornerButton(
            color: kSecondaryColor,
            onPressed: () => controller.signup(),
            child: signup.tr.text.white.bold.xl.make().p8(),
          ).wFull(context),
          20.heightBox,
          ifYouHaveAnAccount.tr.text.white.bold.makeCentered().p2().onTap(() {
            Get.offAllNamed(Routes.LOGIN);
          }),
        ],
      ).pSymmetric(h: 16).backgroundColor(kPrimaryColor),
    ));
  }
}
