import '../../export.dart';

class ResponsivePositioned extends StatelessWidget {
  const ResponsivePositioned({Key? key, required this.child, this.sidePadding = 8, this.top, this.bottom})
      : super(key: key);

  final Widget child;
  final double? sidePadding;
  final double? top;
  final double? bottom;

  @override
  Widget build(BuildContext context) {
    return Get.locale != null
        ? Positioned(
            right: Get.locale!.languageCode.contains('en') ? sidePadding : null,
            left: Get.locale!.languageCode.contains('en') ? null : sidePadding,
            top: top,
            bottom: bottom,
            child: child,
          )
        : Container();
  }
}
