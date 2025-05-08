import 'dart:async';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // Reactive OTP state
  var otp = ''.obs;
  // Reactive countdown timer (in seconds)
  var countdown = 54.obs;
  // Track OTP verification status
  var isOtpVerified = false.obs;
  Timer? _timer;


  Rx<String?> selectedPlan = Rx<String?>(null);

  void selectPlan(String plan) {
    selectedPlan.value = plan;
  }
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    // Start countdown timer
    _startCountdown();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  // Update OTP value
  void updateOtp(String value) {
    otp.value = value;
  }

  // Verify OTP
  Future<void> verifyOtp(String otp) async {
    // Validate OTP
    if (otp.length != 6) {
      Get.snackbar('Error', 'Please enter a 6-digit OTP',
          snackPosition: SnackPosition.BOTTOM);
      isOtpVerified.value = false;
      return;
    }
    if (!GetUtils.isNumericOnly(otp)) {
      Get.snackbar('Error', 'OTP must be numeric',
          snackPosition: SnackPosition.BOTTOM);
      isOtpVerified.value = false;
      return;
    }

    // Simulate OTP verification (replace with actual API call)
    try {
      // Example: await YourApiService.verifyOtp(otp);
      await Future.delayed(Duration(seconds: 1)); // Simulate network delay
      Get.snackbar('Success', 'OTP verified successfully',
          snackPosition: SnackPosition.BOTTOM);
      isOtpVerified.value = true;
    }
    catch (e) {
      Get.snackbar('Error', 'OTP verification failed',
          snackPosition: SnackPosition.BOTTOM);
      isOtpVerified.value = false;
    }
  }

  // Resend OTP
  void resendOtp() {
    // Simulate resending OTP (replace with actual API call)
    Get.snackbar('Info', 'OTP resent successfully',
        snackPosition: SnackPosition.BOTTOM);
    // Example: YourApiService.resendOtp();
    // Reset countdown
    countdown.value = 59;
    _startCountdown();
  }

  // Start countdown timer
  void _startCountdown() {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdown.value > 0) {
        countdown.value--;
      } else {
        timer.cancel();
      }
    });
  }
}