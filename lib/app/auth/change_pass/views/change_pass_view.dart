import '../../../../export.dart';
import '../controllers/change_pass_controller.dart';


class ChangePassView extends GetView<ChangePassController> {
  ChangePassView({Key? key}) : super(key: key);

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
                'Change Password'.text.white.bold.make().p2().wFull(context),
                20.heightBox,
                TextInput(
                  borderColor: Colors.white,
                  controller: controller.passTextController,
                  hint: 'Password',
                  validate: (value) => GetUtils.isGreaterThan(value!.length, 8) ? null : 'pass is wrong',
                ),
                TextInput(
                  controller: controller.confirmTextController,
                  borderColor: Colors.white,
                  hint: 'Confirm Password',
                  validate: (value) => value! == controller.passTextController.text ? null : 'mail is wrong',
                ),
                20.heightBox,
                RoundedCornerButton(
                  onPressed: () => controller.changePass(),
                  color: kPrimaryColor,
                  child: 'Change Password'.text.white.bold.xl.make().p8(),
                ).wFull(context),
                20.heightBox,
              ],
            ).pSymmetric(h: 24),
          ),
        ));
  }
}
