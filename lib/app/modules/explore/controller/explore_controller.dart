import 'dart:io';

import 'package:get/get.dart';

class ExploreController extends GetxController {

  var currentIndex = 0.obs;
  var isFabMenuOpen = false.obs;
  RxBool isselected=false.obs;
  var selectedreportype="".obs;
  Rxn<File> pickedImage = Rxn<File>();
  RxBool hasText = false.obs;

  void onTextChanged(String value) {
    hasText.value = value.trim().isNotEmpty;
  }
}
