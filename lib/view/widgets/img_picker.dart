import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../../export.dart';

class ImgPicker extends StatelessWidget {
  ImgPicker({
    Key? key,
    required this.url,
    required this.onChange,
  }) : super(key: key);

  final Rx<XFile?> image = XFile('').obs;
  final ImagePicker _picker = ImagePicker();

  final String? url;
  final Function(XFile?) onChange;
  @override
  Widget build(BuildContext context) {
    return Obx(() => image.value!.path.isEmpty
        ? FadeInImage.assetNetwork(
            placeholder: 'assets/images/loading.gif',
            imageErrorBuilder: (context, error, stackTrace) {
              return Image.asset('assets/images/rounded_profile.png', fit: BoxFit.contain);
            },
            image: url.toString())
        : CircleAvatar(
            backgroundImage: FileImage(File(image.value!.path)),
          )).h(150).onTap(() async {
      await Get.showOverlay(
          asyncFunction: () async {
            _picker.pickImage(source: ImageSource.gallery).then((value) async {
              image.value = value;
              await onChange(value);
            }).catchError((e) async {
              logger.e(e);
            });
          },
          loadingWidget: Center(child: CircularProgressIndicator()));
    });
  }
}
