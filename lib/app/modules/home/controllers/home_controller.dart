import 'dart:io';

import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;
  var isFabMenuOpen = false.obs;
  RxBool isselected=false.obs;
  var selectedreportype="".obs;
  RxBool ismemorialselected=false.obs;
  Rxn<File> pickedImage = Rxn<File>();
  Rxn<File> pickedImageschedule = Rxn<File>();
  RxBool hasText = false.obs;

  void onTextChanged(String value) {
    hasText.value = value.trim().isNotEmpty;
  }
}
