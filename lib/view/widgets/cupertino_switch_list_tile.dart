import '../../export.dart';
import 'package:flutter/cupertino.dart';

class CupertinoSwitchListTile extends StatelessWidget {
  const CupertinoSwitchListTile({
    Key? key,
    this.onChanged,
    required this.value,
    required this.text,
    this.thumbColor,
    this.trackColor,
    this.textColor,
  }) : super(key: key);

  final Function()? onChanged;
  final RxBool value;
  final String text;
  final Color? thumbColor;
  final Color? trackColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListTile(
          dense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          visualDensity: VisualDensity.compact,
          onTap: () => value.toggle(),
          leading: CupertinoSwitch(
            value: value.value,
            thumbColor: thumbColor,
            activeColor: trackColor,
            trackColor: trackColor,
            onChanged: (isChecked) => value.toggle(),
          ),
          title: text.tr.text.overflow(TextOverflow.ellipsis).bold.make(),
        ));
  }
}
