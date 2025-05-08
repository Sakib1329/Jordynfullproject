import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/auth/controllers/auth_controller.dart';
import 'package:jordyn/app/modules/auth/views/plan_view.dart';
import 'package:jordyn/res/assets/image_assets.dart';
import 'package:jordyn/res/colors/app_color.dart';
import 'package:jordyn/widgets/custom_button.dart';

class LinkSocialView extends GetView<AuthController> {
  const LinkSocialView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(children: [
                      InkWell(
                          onTap: (){Get.back();},
                          child: Image.asset(ImageAssets.back_arrow)),
                    ],),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 60.h),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Link your Social Media',
                                  style: TextStyle(
                                    color: AppColor.buttonColor,
                                    fontSize: 24.sp,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                Text(
                                  'Vestibulum sodales pulvinar accumsan raseing rhoncus neque',
                                  style: TextStyle(
                                    color: AppColor.textGreyColor2,
                                    fontSize: 16.sp,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            CustomButton(
                              onPress: () async {
                                // Get.to(
                                //   VerifyEmailView(),
                                //   transition: Transition.noTransition,
                                // );
                              },
                              title: 'Connect Facebook',
                              height: 48.h,
                              width: 390.w,
                              radius: 10.r,
                              center: false,
                              icon: true,
                              buttonColor: AppColor.textAreaColor,
                              textColor: AppColor.greyTone1,
                            ),
                            SizedBox(height: 20.h),
                            CustomButton(
                              onPress: () async {
                                // Get.to(
                                //   VerifyEmailView(),
                                //   transition: Transition.noTransition,
                                // );
                              },
                              title: 'Connect Instagram',
                              height: 48.h,
                              width: 390.w,
                              radius: 10.r,
                              center: false,
                              icon: true,
                              image: ImageAssets.insta,
                              buttonColor: AppColor.textAreaColor,
                              textColor: AppColor.greyTone1,
                            ),
                            SizedBox(height: 20.h),
                            CustomButton(
                              onPress: () async {
                                // Get.to(
                                //   VerifyEmailView(),
                                //   transition: Transition.noTransition,
                                // );
                              },
                              title: 'Connect X(Twitter)',
                              height: 48.h,
                              width: 390.w,
                              radius: 10.r,
                              center: false,
                              icon: true,
                              image: ImageAssets.x,
                              buttonColor: AppColor.textAreaColor,
                              textColor: AppColor.greyTone1,
                            ),
                            SizedBox(height: 20.h),
                            CustomButton(
                              onPress: () async {
                                // Get.to(
                                //   VerifyEmailView(),
                                //   transition: Transition.noTransition,
                                // );
                              },
                              title: 'Connect Thread',
                              height: 48.h,
                              width: 390.w,
                              radius: 10.r,
                              center: false,
                              icon: true,
                              image: ImageAssets.thread,
                              buttonColor: AppColor.textAreaColor,
                              textColor: AppColor.greyTone1,
                            ),
                            SizedBox(height: 20.h),
                          ],
                        ),
                      ),
                    ),
                    CustomButton(
                      onPress: () async {
                        Get.to(
                          PlanView(),
                          transition: Transition.noTransition,
                        );
                      },
                      title: 'SING UP',
                      height: 48.h,
                      width: 390.w,
                      radius: 100.r,
                    ),
                    SizedBox(height: 15.h),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
