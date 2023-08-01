import '../../../export.dart';

class RowTextIcon extends StatelessWidget {
  const RowTextIcon({
    Key? key,
    required this.text,
    required this.icon,
    this.iconColor,
    this.textColor,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final Color? iconColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor ?? kPrimaryColor,
        ),
        6.widthBox,
        text.text.color(textColor ?? kPrimaryColor).make()
      ],
    );
  }
}
