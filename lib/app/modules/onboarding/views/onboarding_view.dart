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
                child: Image.asset(ImageAssets.onboarding, fit: BoxFit.cover),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: 10.h,),
                    Container(

                        width: 190,
                        height: 180,

                        child: Image.asset(ImageAssets.onboard_logo,)),

                    Spacer(),
                    SafeArea(
                      child: SingleChildScrollView(
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
                              'INSPIRIT helps you honor your loved ones through beautiful, lasting digital memorials.Share stories, photos, and memories that live on—forever connected to family,friends, and future generations.',
                              style: TextStyle(
                                color: AppColor.whiteTextColor,
                                fontSize: 18,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(height: 30.h),
                            CustomButton(
                              onPress: () async {
                                Get.to(
                                  AuthView(),
                                  transition: Transition.noTransition,
                                );
                              },
                              title: 'NEXT',
                              height: 48,
                              width: 390,
                              radius: 100,
                            ),
                            SizedBox(height: 20.h),
                          ],
                        ),
                      ),
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
