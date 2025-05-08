import 'dart:io';

import 'package:get/get.dart';

class MemoryController extends GetxController {


  var isFabMenuOpen = false.obs;
  final RxString selectedTab = 'Memorial'.obs; // Default tab

  void setSelectedTab(String tab) {
    selectedTab.value = tab;
  }
  final RxString hisrtorySelectedTab = 'Memorial'.obs; // Default tab

  void setHistorySelectedTab(String tab) {
    hisrtorySelectedTab.value = tab;
  }
  final count = 0.obs;

  RxBool ismemorialselected=false.obs;
  Rxn<File> pickedImageschedule = Rxn<File>();

}
