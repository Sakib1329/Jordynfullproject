import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/auth/views/auth_view.dart';
import 'package:jordyn/app/modules/auth/views/forget_view.dart';
import 'package:jordyn/app/modules/profile/views/verify_email_view.dart';
import 'package:jordyn/res/assets/image_assets.dart';
import 'package:jordyn/res/colors/app_color.dart';
import 'package:jordyn/widgets/custom_button.dart';
import 'package:jordyn/widgets/input_text_widget.dart';
import '../controllers/auth_controller.dart';

class UpdatePasswordView extends GetView<AuthController> {
  UpdatePasswordView({super.key});

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
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30.h),
                    Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset(ImageAssets.back_arrow),
                        ),
                        Center(child: Image.asset(ImageAssets.auth_logo)),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Create Password',
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
                    InputTextWidget(
                      onChanged: (e) {},
                      borderColor: AppColor.backgroundColor,
                      hintText: 'Create your password',
                      leadingIcon: ImageAssets.pass,
                      leading: true,
                      obscureText: true,
                      textColor: AppColor.textGreyColor2,
                      height: 48.h,
                      width: 390.w,
                    ),
                    SizedBox(height: 15.h),
                    InputTextWidget(
                      onChanged: (e) {},
                      borderColor: AppColor.backgroundColor,
                      hintText: 'Confirm your password',
                      leadingIcon: ImageAssets.pass,
                      leading: true,
                      obscureText: true,
                      textColor: AppColor.textGreyColor2,
                      height: 48.h,
                      width: 390.w,
                    ),
                    SizedBox(height: 65.h),
                    CustomButton(
                      onPress: () async {
                        Get.to(
                          VerifyEmailView(),
                          transition: Transition.noTransition,
                        );
                      },
                      title: 'Update Password',
                      height: 48.h,
                      width: 390.w,
                      radius: 100,
                    ),
                    SizedBox(height: 10.h),

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
