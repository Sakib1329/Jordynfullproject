import 'package:get/get.dart';

import '../../../../app/modules/auth/pin_code_field/controllers/pin_code_field.controller.dart';

class PinCodeFieldControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PinCodeFieldController>(
      () => PinCodeFieldController(),
    );
  }
}
