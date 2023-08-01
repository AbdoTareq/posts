import '../../export.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
  }) : super(key: key);

  final Widget? title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      title: title,
      subtitle: subtitle,
      onTap: onTap,
      contentPadding: EdgeInsets.all(0),
      visualDensity: VisualDensity.compact,
      trailing: trailing,
      leading: leading,
    );
  }
}
