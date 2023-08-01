import '../../export.dart';

class PaymentChoose extends StatelessWidget {
  PaymentChoose({
    Key? key,
  }) : super(key: key);
  final selectedRadio = 1.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            'Payment Method'.text.bold.xl.make(),
            RadioListTile<int>(
                dense: true,
                title:
                    Image.asset('assets/images/payment/mada.png', alignment: Alignment.topLeft).h2(context),
                value: 1,
                groupValue: selectedRadio.value,
                onChanged: (int? val) => selectedRadio(val)),
            RadioListTile<int>(
                dense: true,
                title: Image.asset('assets/images/payment/stc.png', alignment: Alignment.topLeft).h2(context),
                value: 2,
                groupValue: selectedRadio.value,
                onChanged: (int? val) => selectedRadio(val)),
            RadioListTile<int>(
                dense: true,
                title: Image.asset('assets/images/payment/apple_pay.png', alignment: Alignment.topLeft)
                    .h2(context),
                value: 3,
                groupValue: selectedRadio.value,
                onChanged: (int? val) => selectedRadio(val)),
            RadioListTile<int>(
                dense: true,
                title: Row(
                  children: [
                    Image.asset('assets/images/payment/visa.png', alignment: Alignment.topLeft).h2(context),
                    Image.asset('assets/images/payment/mastercard.png', alignment: Alignment.topLeft)
                        .h2(context),
                  ],
                ),
                value: 4,
                groupValue: selectedRadio.value,
                onChanged: (int? val) => selectedRadio(val)),
          ],
        ));
  }
}
