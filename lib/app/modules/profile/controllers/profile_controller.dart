import 'package:get/get.dart';

class ProfileController extends GetxController {

  final RxString accountSelectedTab = 'Post'.obs; // Default tab

  void setAccountSelectedTab(String tab) {
    accountSelectedTab.value = tab;
  }final RxString SelectedTab = 'account'.obs; // Default tab

  void setSelectedTab(String tab) {
    SelectedTab.value = tab;
  }
  final count = 0.obs;

  RxBool isrequestsent=false.obs;
  RxString searchQuery = ''.obs;
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



  Rx<String?> selectedPlan = Rx<String?>(null);

  void selectPlan(String plan) {
    selectedPlan.value = plan;
  }
  var isSwitched = false.obs;

  void toggleSwitch(bool value) {
    isSwitched.value = value;
  }
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
