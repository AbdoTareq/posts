import '../../export.dart';

//لما اكون عايز اخلي widget موجوده ف اخر الشاشه من تحت
// مع العلم ان انها بداخل SingleChildScrollView

class CustomScrollableForm extends StatelessWidget {
  CustomScrollableForm({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverFillRemaining(
        hasScrollBody: false,
        child: child,
      )
    ]);
  }
}
