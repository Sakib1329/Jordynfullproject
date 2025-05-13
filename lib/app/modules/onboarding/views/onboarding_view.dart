import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/auth/views/auth_view.dart';
import 'package:jordyn/res/assets/image_assets.dart';
import 'package:jordyn/res/colors/app_color.dart';
import 'package:jordyn/widgets/custom_button.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Scaffold(
          body: Stack(
            children: [
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(ImageAssets.onboarding, fit: BoxFit.fill),
              ),
              Positioned(
                top: 40,
                left: 130,
                child: Image.asset(ImageAssets.onboard_logo),
              ),
              Positioned(
                bottom: 50,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Celebrate Lives, Keep\nMemories Alive',
                      style: TextStyle(
                        color: AppColor.buttonColor,
                        fontSize: 28,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'INSPIRIT helps you honor your loved ones\nthrough beautiful, lasting digital memorials.\nShare stories, photos, and memories that\nlive on—forever connected to family,\nfriends, and future generations.',
                      style: TextStyle(
                        color: AppColor.whiteTextColor,
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 50.h),
                    CustomButton(
                      onPress: () async {
                        Get.to(AuthView(), transition: Transition.noTransition);
                      },
                      title: 'NEXT',
                      height: 48,
                      width: 390,
                      radius: 100,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
