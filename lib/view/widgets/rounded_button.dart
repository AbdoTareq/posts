import '../../export.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        text.text.bold.white.xl3.makeCentered().capsule(backgroundColor: kPrimaryColor).h8(context),
      ],
    );
  }
}
