
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MemoryController extends GetxController {
  RxInt selectedIndex = (-1).obs;
  RxString selectedeventtype = ''.obs;
  var selectedRole = ''.obs;
  // Reactive search query for AppBar TextField
  var searchQuery = ''.obs;

  // Set selected role
  void setSelectedRole(String role) {
    selectedRole.value = role;
  }
  void selectOption(int index, String text) {
    selectedIndex.value = index;
    selectedeventtype.value = text;
  }
  // Update search query
  void updateSearchQuery(String value) {
    searchQuery.value = value;
  }
  final RxString selectedTab = 'Memorial'.obs; // Default tab

  void setSelectedTab(String tab) {
    selectedTab.value = tab;
  }
  final RxString hisrtorySelectedTab = 'Memorial'.obs; // Default tab

  void setHistorySelectedTab(String tab) {
    hisrtorySelectedTab.value = tab;
  }
  final count = 0.obs;

  RxBool isFabVisible = true.obs;
  // Reactive variable for memorial selection
  RxBool ismemorialselected = false.obs;
  // Reactive list to store image paths
  RxList<String> imagePaths = <String>[].obs;

  // Toggle FAB visibility
  void toggleFabVisibility() {
    isFabVisible.value = !isFabVisible.value;
  }

  // Pick image or video from gallery
  Future<void> pickVideoOrImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imagePaths.add(pickedFile.path); // Add the image path to the list
      ismemorialselected.value = false; // Update the memorial selection state
      Get.snackbar(
        'Success',
        'Image added successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        'Info',
        'No image selected',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // Remove image from the list
  void removeImage(int index) {
    if (index >= 0 && index < imagePaths.length) {
      imagePaths.removeAt(index);
      Get.snackbar(
        'Success',
        'Image removed successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onClose() {
    // Clean up resources (e.g., timers, streams)
    super.onClose();
  }



  // RxBool isselected=false.obs;
  // var selectedreportype="".obs;
}
