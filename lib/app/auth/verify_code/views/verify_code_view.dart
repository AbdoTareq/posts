import 'package:flutter_new_template/app/auth/verify_code/controllers/verify_code_controller.dart';

import '../../../../export.dart';

class VerifyCodeView extends GetView<VerifyCodeController> {
  VerifyCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kbackgroundColor,
        body: SafeArea(
          child: ListView(
            children: [
              100.heightBox,
              'Account recovery'.text.white.bold.xl2.make().p2().wFull(context),
              'To get a verification code has been sent to '
                  .richText
                  .withTextSpanChildren([
                    'ahmedmoh52@gmail.com'.textSpan.bold.make(),
                    const TextSpan(text: ' please enter it to verify.'),
                  ])
                  .white
                  .xl
                  .make()
                  .p2(),
              120.heightBox,
              VxPinView(
                color: Colors.white,
                fill: true,
                obscureText: false,
                radius: 6,
                size: Get.width * .13,
                keyboardType: TextInputType.number,
              ),
              20.heightBox,
              CountDownTimer(
                  textColor: Colors.white,
                  secondsRemaining: 120,
                  whenTimeExpires: () {
                    logger.i("complete}");
                  }),
              20.heightBox,
              RoundedCornerButton(
                onPressed: () => controller.verify(),
                color: kPrimaryColor,
                child: 'Confirm'.text.white.bold.xl.make().p8(),
              ).wFull(context),
              60.heightBox,
              'Didn\'t receive a code? Try again'.text.white.bold.center.xl.make().p2().wFull(context),
            ],
          ).pSymmetric(h: 24),
        ));
  }
}
