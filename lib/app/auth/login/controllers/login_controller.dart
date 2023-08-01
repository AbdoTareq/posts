import '../../../../export.dart';
import '../../../../repos/auth_repo.dart';

class LoginController extends GetxController {
  final AuthRepositoryImp repository = AuthRepositoryImp();

  final storage = GetStorage();
  final GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController mailTextController = TextEditingController();
  TextEditingController passTextController = TextEditingController();
  final RxBool showPass = false.obs;

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      var user = {
        "email": mailTextController.text,
        "password": passTextController.text,
      };
      await handleRequestWithoutLoading(() async {
        final response = await repository.login(user);
        response.fold((_) {}, (r) {
          logger.i(r.data["token"]);
          storage.write('token', r.data["token"]);
          Get.offAllNamed(Routes.NAV);
        });
      });
    }
  }

  @override
  void onClose() {
    super.onClose();
    mailTextController.dispose();
    passTextController.dispose();
  }
}
