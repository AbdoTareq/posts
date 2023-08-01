import '../../export.dart';

class RoundedIconText extends StatelessWidget {
  const RoundedIconText({
    Key? key,
    required this.iconName,
    required this.title,
    required this.destinationPage,
    this.imageScale = 2.5,
  }) : super(key: key);

  final String iconName;
  final String title;
  final double imageScale;
  final Widget destinationPage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: [
        Image.asset(
          '$baseImagePath$iconName.png',
          scale: imageScale,
        ),
        title.tr.text.center.extraBold.make().pSymmetric(h: 16),
      ].vStack().centered().card.circular.p8.make(),
      onTap: () => Get.to(destinationPage),
    );
  }
}
