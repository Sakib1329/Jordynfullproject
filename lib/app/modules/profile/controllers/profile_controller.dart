import 'package:get/get.dart';

class ProfileController extends GetxController {

  Rx<String?> selectedPlan = Rx<String?>(null);

  void selectPlan(String plan) {
    selectedPlan.value = plan;
  }
  var isSwitched = false.obs;

  void toggleSwitch(bool value) {
    isSwitched.value = value;
  }
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
