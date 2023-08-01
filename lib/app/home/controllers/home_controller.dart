import 'package:flutter_new_template/utils/utils.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  Future<void> onReady() async {
    await getAll();
    super.onReady();
  }

  getAll() async {
    await handleRequest(() async {});
  }
}
