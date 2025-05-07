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

class SignInView extends GetView<AuthController> {
  SignInView({super.key});

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
                    Center(child: Image.asset(ImageAssets.auth_logo)),
                    SizedBox(height: 20.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sign In',
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
                      hintText: 'Enter your email',
                      leadingIcon: ImageAssets.email,
                      textColor: AppColor.textGreyColor2,
                      leading: true,
                      height: 48.h,
                      width: 390.w,
                    ),
                    SizedBox(height: 15.h),
                    InputTextWidget(
                      onChanged: (e) {},
                      borderColor: AppColor.backgroundColor,
                      hintText: 'Enter your password',
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
                      title: 'Sign In',
                      height: 48.h,
                      width: 390.w,
                      radius: 100,
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(
                              ForgetView(),
                              transition: Transition.noTransition,
                            );
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: AppColor.greyTone,
                              fontSize: 14.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account?',
                          style: TextStyle(
                            color: AppColor.textGreyColor3,
                            fontSize: 16.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(
                              AuthView(),
                              transition: Transition.noTransition,
                            );
                          },
                          child: Text(
                            ' Sign Up',
                            style: TextStyle(
                              color: AppColor.buttonColor,
                              fontSize: 16.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      'or',
                      style: TextStyle(
                        color: AppColor.greyTone,
                        fontSize: 20.sp,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      'Continue with',
                      style: TextStyle(
                        color: AppColor.greyTone,
                        fontSize: 16.sp,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 25.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 20.w,
                      children: [
                        SvgPicture.asset(
                          ImageAssets.google,
                          height: 42.h,
                          width: 78.w,
                        ),
                        SvgPicture.asset(
                          ImageAssets.facebook,
                          height: 42.h,
                          width: 78.w,
                        ),
                        SvgPicture.asset(
                          ImageAssets.apple,
                          height: 42.h,
                          width: 78.w,
                        ),
                      ],
                    ),
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
