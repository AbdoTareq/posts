import '../../../../export.dart';

import '../controllers/reset_pass_controller.dart';

class ResetPassView extends GetView<ResetPassController> {
  ResetPassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kbackgroundColor,
        body: SafeArea(
          child: Form(
            key: controller.formKey,
            child: ListView(
              children: [
                (Get.height * .2).heightBox,
                Image.asset('$baseImagePath/logo.png').centered(),
                60.heightBox,
                'Reset Password'.text.white.bold.make().p2().wFull(context),
                20.heightBox,
                TextInput(
                  borderColor: Colors.white,
                  controller: controller.mailTextController,
                  hint: 'Email',
                  validate: (value) => GetUtils.isEmail(value!) ? null : 'Email is wrong',
                ),
                20.heightBox,
                RoundedCornerButton(
                  onPressed: () => controller.resetPass(),
                  color: kPrimaryColor,
                  child: 'Send Code'.text.white.bold.xl.make().p8(),
                ).wFull(context),
                20.heightBox,
              ],
            ).pSymmetric(h: 24),
          ),
        ));
  }
}
