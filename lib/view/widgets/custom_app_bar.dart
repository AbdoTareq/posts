import 'package:flutter/material.dart';
import 'package:flutter_new_template/constants.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: kSecondaryColor,
      elevation: 0,
      backgroundColor: Colors.white,
      titleSpacing: 0,
      title: title.tr.text.xl.start
          .color(kSecondaryColor)
          .overflow(TextOverflow.ellipsis)
          .bold
          .make()
          .p8(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
