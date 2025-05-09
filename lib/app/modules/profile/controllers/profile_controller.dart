import 'package:get/get.dart';

class ProfileController extends GetxController {
  final RxString accountSelectedTab = 'Post'.obs; // Default tab

  void setAccountSelectedTab(String tab) {
    accountSelectedTab.value = tab;
  }
  final count = 0.obs;


}
