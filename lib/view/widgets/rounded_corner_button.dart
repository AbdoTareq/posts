import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class RoundedCornerButton extends StatelessWidget {
  const RoundedCornerButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.color,
    this.isOutlined = false,
    this.borderColor,
  }) : super(key: key);

  final Function() onPressed;
  final Color? color;
  final Color? borderColor;
  final Widget child;
  final bool isOutlined;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * .065,
      child: ElevatedButton(
          child: child,
          style: isOutlined
              ? ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(color: kPrimaryColor),
                  )))
              : ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(color ?? kPrimaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ))),
          onPressed: onPressed),
    );
  }
}
