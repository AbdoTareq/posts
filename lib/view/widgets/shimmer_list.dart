import '../../export.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({
    Key? key,
    this.count = 6,
    this.child,
    this.listChild,
    this.childHeight = 120,
  }) : super(key: key);

  final int? count;
  final Widget? child;
  final double? childHeight;
  final Widget? listChild;

  @override
  Widget build(BuildContext context) {
    return child ??
        ListView.builder(
          itemCount: count,
          itemBuilder: (context, index) {
            return VxShimmer(
                child: listChild ?? ShimmerChild(height: childHeight));
          },
        );
  }
}

class ShimmerChild extends StatelessWidget {
  const ShimmerChild({
    Key? key,
    this.height = 80,
    this.width,
  }) : super(key: key);

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(height: height, width: width),
    );
  }
}
