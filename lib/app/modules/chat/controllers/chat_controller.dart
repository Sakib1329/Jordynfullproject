import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {

  RxBool isrequestsent=false.obs;
  RxString searchQuery = ''.obs;
  var message = ''.obs;
  RxBool isuserblocked=false.obs;
  RxBool istapped=false.obs;
  Rxn<File> pickedImage = Rxn<File>();
  RxSet<String> selectedUsers = <String>{}.obs;
  final textController = TextEditingController();
  var selectedGroupType = 'Public'.obs;
  void toggleSelection(String name) {
    if (selectedUsers.contains(name)) {
      selectedUsers.remove(name);
    } else {
      selectedUsers.add(name);
    }
  }

// Check if a user is selected
  bool isSelected(String name) {
    return selectedUsers.contains(name);
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }

  final List<String> names = [
    'Livia Workman',
    'Ethan Rivers',
    'Mila Greene',
    'Noah Carter',
    'Ava Brooks',
    'Lucas Hale',
    'Emma Stone',
    'Liam Woods',
    'Olivia West',
    'Mason Hayes',
    'Isla Knight',
    'Elijah Ford',
    'Chloe Ray',
    'Logan King',
    'Sofia Lane',
    'James Cole',
    'Amelia Blake',
  ];

}