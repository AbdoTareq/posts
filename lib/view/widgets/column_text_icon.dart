import '../../export.dart';

class ColumnTextIcon extends StatelessWidget {
  const ColumnTextIcon({
    Key? key,
    required this.text,
    required this.imageName,
    this.textColor,
  }) : super(key: key);

  final String text;
  final String imageName;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('$baseImagePath/$imageName.png').p4(),
        text.text.color(textColor ?? kPrimaryColor).bold.xs.make()
      ],
    );
  }
}
