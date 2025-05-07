import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jordyn/res/assets/image_assets.dart';
import 'package:jordyn/res/colors/app_color.dart';

import 'onboarding_view.dart';

class SplashView extends GetView {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      try {

        Get.offAll(() => const OnboardingView(),transition: Transition.fadeIn);

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
