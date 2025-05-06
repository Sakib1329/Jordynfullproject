import 'package:get/get.dart';

import '../../../../app/modules/auth/widget/controllers/widget.controller.dart';

class WidgetControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WidgetController>(
      () => WidgetController(),
    );
  }
}
