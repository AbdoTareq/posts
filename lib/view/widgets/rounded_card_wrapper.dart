import '../../export.dart';

class RoundedCardWrapper extends StatelessWidget {
  const RoundedCardWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(decoration: kRoundedAll, child: child).p8();
  }
}
