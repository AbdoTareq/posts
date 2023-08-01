import '../../export.dart';

class BottomSheetWrapper extends StatelessWidget {
  const BottomSheetWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    ).cornerRadius(10);
  }
}
