import 'dart:io';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ExploreController extends GetxController {
  final Rx<GoogleMapController?> mapController = Rx<GoogleMapController?>(null);
  static const LatLng initialLocation = LatLng(40.735657, -73.996167); // 47 W 13th St, New York

  final Set<Marker> markers = {
    const Marker(
      markerId: MarkerId('location'),
      position: initialLocation,
      infoWindow: InfoWindow(title: '47 W 13th St, New York'),
    ),
  };

  @override
  void onInit() {
    super.onInit();
    print('ExploreController initialized'); // Debug log
  }

  void onMapCreated(GoogleMapController controller) {
    print('Map created successfully'); // Debug log
    mapController.value = controller;
  }

  @override
  void onClose() {
    mapController.value?.dispose();
    print('Map controller disposed'); // Debug log
    super.onClose();
  }

  var currentIndex = 0.obs;
  var isFabMenuOpen = false.obs;
  RxBool isselected = false.obs;
  var selectedreportype = "".obs;
  Rxn<File> pickedImage = Rxn<File>();
  RxBool hasText = false.obs;
  final RxString selectedTab = 'User'.obs; // Default tab

  void setSelectedTab(String tab) {
    selectedTab.value = tab;
  }

  final RxString accountSelectedTab = 'Post'.obs; // Default tab

  void setAccountSelectedTab(String tab) {
    accountSelectedTab.value = tab;
  }

  void onTextChanged(String value) {
    hasText.value = value.trim().isNotEmpty;
  }
}