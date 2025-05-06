import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jordyn/app/modules/onboarding/views/onboarding_view.dart';
import 'package:jordyn/res/assets/image_assets.dart';
import 'package:jordyn/res/colors/app_color.dart';

class SplashView extends GetView {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      try {
<<<<<<< HEAD
        Get.offAll(() => const OnboardingView(),transition: Transition.noTransition);
=======
        Get.offAll(() => const OnboardingView(),transition: Transition.rightToLeft);
>>>>>>> e075cd0be43f5d7005099e4a3226a8937669d250
      } catch (e) {
        Get.snackbar(
          'Navigation Error',
          'Failed to navigate to Home screen: $e',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    });
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body:  Center(child: Image.asset(ImageAssets.splash)),
    );
  }
}
