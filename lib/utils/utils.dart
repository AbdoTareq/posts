import '../export.dart';

// methods
showWarningDialog({String title = '', String text = ''}) async {
  await showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: (title.isNotEmpty ? title.tr : '👍').tr.text.isIntrinsic.bold.xl2.makeCentered(),
          content: (text.isNotEmpty ? text.tr : 'under_dev'.tr).tr.text.isIntrinsic.bold.xl.make(),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(yes.tr),
            ),
          ],
        );
      });
}

showOptionsDialog({String title = '', String text = '', required Function() yesFunction}) async {
  await Get.defaultDialog(
      title: title.isNotEmpty ? title.tr : 'watch'.tr,
      middleText: text.isNotEmpty ? text.tr : 'under_dev'.tr,
      titleStyle: TextStyle(color: Colors.red),
      actions: [
        ElevatedButton(
          onPressed: yesFunction,
          child: Text(
            'yes'.tr,
            style: TextStyle(color: Colors.red),
          ),
        ),
        ElevatedButton(
          onPressed: () => Get.back(),
          child: Text(
            'cancel'.tr,
          ),
        ),
      ]);
}

showSimpleDialog({String title = '', String text = ''}) async {
  await showDialog(
      context: Get.context!,
      builder: (context) {
        Future.delayed(Duration(seconds: 1), () {
          Navigator.of(context).pop(true);
        });
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: (title.isNotEmpty ? title.tr : '👍').tr.text.isIntrinsic.bold.xl2.makeCentered(),
          content: (text.isNotEmpty ? text.tr : 'Success'.tr).tr.text.isIntrinsic.bold.xl.make(),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(yes.tr),
            ),
          ],
        );
      });
}

showSuccessSnack({String title = '', String text = ''}) {
  Get.snackbar(title.isNotEmpty ? title.tr : '👍'.tr, text.isNotEmpty ? text.tr : 'under_dev'.tr,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 6),
      backgroundColor: Colors.green,
      barBlur: 10,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(8));
}

showFailSnack({String title = '', String text = '', Function()? yesFunction}) {
  Get.snackbar(title.isNotEmpty ? title.tr : watch.tr, text.isNotEmpty ? text.tr : 'under_dev'.tr,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 15),
      barBlur: 10,
      mainButton: TextButton(
        onPressed: yesFunction,
        child: yes.tr.text.isIntrinsic.color(kPrimaryColor).bold.xl.make().p8(),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(8));
}

Future<Null> handleRequest(Future<Null> Function() asyncFunction,
    {bool showMessage = false, String? message}) async {
  Get.showOverlay(
      asyncFunction: () async {
        await asyncFunction().catchError((e) async {
          logger.e(e);
          if (e.toString().contains('Unauthenticated')) {
            showFailSnack(
                text: login_to_continue,
                yesFunction: () {
                  Get.back();
                  Get.offAllNamed(Routes.LOGIN);
                });
          } else
            //? u can't await the dialog as it will stops the flow & will not dismiss the center loading
            showWarningDialog(title: message ?? 'error'.tr, text: e.toString());
        });
      },
      loadingWidget: Center(child: CircularProgressIndicator()));
}

Future<dynamic> handleRequestWithoutLoading(Future<dynamic> Function() asyncFunction,
    {bool showMessage = false, String? message, Function(dynamic e)? onError}) async {
  await asyncFunction().catchError((e) async {
    logger.e(e);
    if (onError != null) onError(e);
    if (e.toString().contains('Unauthenticated')) {
      showFailSnack(
          text: login_to_continue,
          yesFunction: () {
            Get.back();
            Get.offAllNamed(Routes.LOGIN);
          });
    } else {
      List<String> messages = e.toString().replaceAll('}', '').split('message:');
      await showWarningDialog(
          title: message ?? 'error'.tr, text: messages.length > 1 ? messages[1] : messages[0]);
    }
  });
}

getColorFromHex(String color) => Color(int.parse(color.toString().replaceAll('#', '0xff')));
