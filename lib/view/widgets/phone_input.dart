import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

// TextField that takes TextEditingController from the main controller(ex:LoginController) to control text from outside to be independent widget
class PhoneInput extends StatelessWidget {
  const PhoneInput({
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
    this.border,
    this.showUnderline = true,
    this.hintColor,
    this.autofillHints,
    this.minLines,
    this.maxLines,
    this.initialCountryCode,
    this.countries,
    this.showCountryCode = false,
  }) : super(key: key);

  final FocusNode? focus;
  final Function? function;
  final String hint;
  final String? initialCountryCode;
  final List<String>? countries;

  final bool spaceAfter;
  final TextInputType? inputType;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final Function(PhoneNumber)? onChanged;
  final double? fontSize;
  final bool registerFocus;
  final bool isPass;
  final Function()? onTap;
  final bool disableInput;
  final Color? borderColor;
  final FutureOr<String?> Function(PhoneNumber?)? validate;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? color;
  final Color? textColor;
  final Color? hintColor;
  final OutlineInputBorder? border;
  final TextEditingController controller;
  final bool showUnderline;
  final bool showCountryCode;
  final Iterable<String>? autofillHints;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      flagsButtonMargin: EdgeInsets.only(left: 20),
      style: TextStyle(color: textColor == null ? borderColor : textColor),
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      showDropdownIcon: false,
      showCountryCode: showCountryCode,
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
            ? TextStyle(fontSize: fontSize, color: hintColor)
            : TextStyle(fontSize: fontSize, color: hintColor),
        labelText: hint.tr,
        suffixIcon: suffixIcon,
        suffixIconConstraints: const BoxConstraints(
          minWidth: 80,
        ),
        prefixIcon: prefixIcon,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 80,
        ),
        border: !showUnderline ? InputBorder.none : border,
        enabledBorder: borderColor != null
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: borderColor!,
                  width: 2.0,
                ),
              )
            : null,
        focusedErrorBorder: borderColor != null
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: borderColor!,
                  width: 2.0,
                ),
              )
            : null,
        errorBorder: borderColor != null
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
      countries: countries,
      initialCountryCode: initialCountryCode,
      cursorColor: borderColor,
      onChanged: onChanged,
      textInputAction: TextInputAction.next,
      autofocus: registerFocus,
      enabled: !disableInput,
      obscureText: isPass,
      inputFormatters: [
        if (inputType == TextInputType.number) FilteringTextInputFormatter.allow(RegExp("[-0-9,.]")),
      ],
      readOnly: disableInput,
      validator: validate,
    );
  }
}
