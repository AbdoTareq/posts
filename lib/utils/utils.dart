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
          title: (title.isNotEmpty ? title.tr : '👍')
              .tr
              .text
              .isIntrinsic
              .bold
              .xl2
              .makeCentered(),
          content: (text.isNotEmpty ? text.tr : 'under_dev'.tr)
              .tr
              .text
              .isIntrinsic
              .bold
              .xl
              .make(),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(yes.tr),
            ),
          ],
        );
      });
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
          title: (title.isNotEmpty ? title.tr : '👍')
              .tr
              .text
              .isIntrinsic
              .bold
              .xl2
              .makeCentered(),
          content: (text.isNotEmpty ? text.tr : 'Success'.tr)
              .tr
              .text
              .isIntrinsic
              .bold
              .xl
              .make(),
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
  Get.snackbar(title.isNotEmpty ? title.tr : '👍'.tr,
      text.isNotEmpty ? text.tr : 'under_dev'.tr,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 6),
      backgroundColor: Colors.green,
      barBlur: 10,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(8));
}

showFailSnack({String title = '', String text = '', Function()? yesFunction}) {
  Get.snackbar(title.isNotEmpty ? title.tr : watch.tr,
      text.isNotEmpty ? text.tr : 'under_dev'.tr,
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
          showWarningDialog(title: message ?? 'error'.tr, text: e.toString());
        });
      },
      loadingWidget: Center(child: CircularProgressIndicator()));
}

Future<dynamic> handleRequestWithoutLoading(
    Future<dynamic> Function() asyncFunction,
    {bool showMessage = false,
    String? message,
    Function(dynamic e)? onError}) async {
  await asyncFunction().catchError((e) async {
    logger.e(e);
    if (onError != null) onError(e);
    List<String> messages = e.toString().replaceAll('}', '').split('message:');
    await showWarningDialog(
        title: message ?? 'error'.tr,
        text: messages.length > 1 ? messages[1] : messages[0]);
  });
}
