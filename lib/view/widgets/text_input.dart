import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// TextField that takes TextEditingController from the main controller(ex:LoginController) to control text from outside to be independent widget
class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    this.focus,
    required this.controller,
    this.function,
    required this.hint,
    this.spaceAfter = true,
    this.inputType,
    this.maxLength,
    this.registerFocus = false,
    this.isPass = false,
    this.onTap,
    this.disableInput = false,
    this.borderColor,
    this.validate,
    this.suffixIcon,
    this.prefixIcon,
    this.fontSize,
    this.color,
    this.onChanged,
    this.textColor,
    this.showUnderline = true,
    this.hintColor,
    this.autofillHints,
    this.minLines,
    this.maxLines,
  }) : super(key: key);

  final FocusNode? focus;
  final Function? function;
  final String hint;
  final bool spaceAfter;
  final TextInputType? inputType;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final Function(String value)? onChanged;
  final double? fontSize;
  final bool registerFocus;
  final bool isPass;
  final Function()? onTap;
  final bool disableInput;
  final Color? borderColor;
  final String? Function(String?)? validate;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? color;
  final Color? textColor;
  final Color? hintColor;
  final TextEditingController controller;
  final bool showUnderline;
  final Iterable<String>? autofillHints;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: autofillHints,
      style: TextStyle(color: textColor == null ? borderColor : textColor),
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        errorStyle: TextStyle(fontSize: 12, height: 0.8),
        filled: color != null,
        fillColor: color,
        labelStyle: hintColor != null
            ? TextStyle(color: hintColor, fontSize: fontSize)
            : borderColor != null
                ? TextStyle(color: borderColor, fontSize: fontSize)
                : TextStyle(fontSize: fontSize),
        hintStyle: borderColor != null
            ? TextStyle(color: borderColor, fontSize: fontSize)
            : TextStyle(fontSize: fontSize),
        labelText: hint.tr,
        suffixIcon: suffixIcon,
        suffixIconConstraints: const BoxConstraints(
          minWidth: 80,
        ),
        prefixIcon: prefixIcon,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 80,
        ),
        border: !showUnderline
            ? InputBorder.none
            : const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                Radius.circular(15),
              )),
        enabledBorder: borderColor != null
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: borderColor!,
                  width: 2.0,
                ),
              )
            : null,
        focusedBorder: borderColor != null
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: borderColor!,
                  width: 2.0,
                ),
              )
            : null,
      ),
      onTap: onTap,
      cursorColor: borderColor,
      onChanged: onChanged,
      minLines: minLines,
      maxLines: maxLines,
      textInputAction: TextInputAction.next,
      autofocus: registerFocus,
      enableInteractiveSelection: !disableInput,
      enabled: !disableInput,
      keyboardType: inputType,
      obscureText: isPass,
      inputFormatters: [
        if (inputType == TextInputType.number) FilteringTextInputFormatter.allow(RegExp("[-0-9,.]")),
      ],
      readOnly: disableInput,
      maxLength: maxLength,
      onFieldSubmitted: (v) async {
        FocusScope.of(context).requestFocus(focus);
        try {
          await function!();
        } catch (e) {}
      },
      validator: validate,
    ).paddingOnly(bottom: spaceAfter ? 16 : 0);
  }
}
