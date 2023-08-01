import '../../export.dart';

class PasswordInput extends StatelessWidget {
  PasswordInput({
    Key? key,
    required this.controller,
    required this.hint,
    this.validate,
    this.isUnderline = true,
    this.borderColor,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;
  final RxBool showPass = false.obs;
  final bool isUnderline;
  final String? Function(String?)? validate;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextInput(
          borderColor: borderColor,
          controller: controller,
          autofillHints: [AutofillHints.password],
          hint: hint,
          showUnderline: isUnderline,
          suffixIcon: Icon(!showPass.value ? Icons.visibility : Icons.visibility_off, color: borderColor)
              .onTap(() => showPass.toggle()),
          prefixIcon: Icon(Icons.lock, color: borderColor),
          isPass: showPass.value,
          validate: validate ?? (value) => GetUtils.isGreaterThan(value!.length, 5) ? null : passWar.tr,
        ));
  }
}
