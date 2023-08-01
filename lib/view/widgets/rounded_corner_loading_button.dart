import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class RoundedCornerLoadingButton extends StatefulWidget {
  const RoundedCornerLoadingButton({
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
  State<RoundedCornerLoadingButton> createState() => _RoundedCornerLoadingButtonState();
}

class _RoundedCornerLoadingButtonState extends State<RoundedCornerLoadingButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * .065,
      child: ElevatedButton(
          child: isLoading ? Center(child: CircularProgressIndicator(color: kPrimaryColor)) : widget.child,
          style: widget.isOutlined
              ? ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(color: kPrimaryColor),
                  )))
              : ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(widget.color ?? kPrimaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ))),
          onPressed: () async {
            setState(() {
              isLoading = true;
            });
            await widget.onPressed();
            setState(() {
              isLoading = false;
            });
          }),
    );
  }
}
