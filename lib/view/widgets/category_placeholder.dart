import 'package:shimmer/shimmer.dart';

import '../../export.dart';

class CategoryPlaceholder extends StatelessWidget {
  const CategoryPlaceholder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: AspectRatio(
        aspectRatio: 2.15,
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      baseColor: Colors.white,
      highlightColor: Colors.grey[300] ?? Colors.grey,
    );
  }
}
