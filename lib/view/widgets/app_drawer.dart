import 'package:flutter_new_template/app_settings_controller.dart';

import '../../export.dart';

class AppDrawer extends GetView<AppSettingsController> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => SwitchListTile(
                title: darkMode.tr.text.bold.make(),
                value: controller.darkMode.value,
                onChanged: (_) {
                  controller.darkMode.toggle();
                  controller.box.write('dark', controller.darkMode.value);
                }),
          ),
          Obx(
            () => SwitchListTile(
                title: language.tr.text.bold.make(),
                value: controller.lang.value,
                onChanged: (_) {
                  controller.lang.toggle();
                  controller.box.write('language', controller.lang.value);
                }),
          ),
        ],
      ).centered(),
    );
  }
}
