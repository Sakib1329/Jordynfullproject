import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/auth/views/sign_in_view.dart';
import 'package:jordyn/app/modules/auth/views/verify_email_view.dart';
import 'package:jordyn/res/assets/image_assets.dart';
import 'package:jordyn/res/colors/app_color.dart';
import 'package:jordyn/widgets/custom_button.dart';
import 'package:jordyn/widgets/input_text_widget.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
   const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      Center(child: Image.asset(ImageAssets.auth_logo)),
                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Create New Account',
                            style: TextStyle(
                              color: AppColor.buttonColor,
                              fontSize: 24,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Vestibulum sodales pulvinar accumsan raseing rhoncus neque',
                            style: TextStyle(
                              color: AppColor.textGreyColor2,
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      InputTextWidget(
                        onChanged: (e) {},
                        borderColor: AppColor.backgroundColor,
                        hintText: 'Enter your email',
                        leadingIcon: ImageAssets.email,
                        textColor: AppColor.textGreyColor2,
                        leading: true,
                        height: 48,
                        width: 390,
                      ),
                      SizedBox(height: 15),
                      InputTextWidget(
                        onChanged: (e) {},
                        borderColor: AppColor.backgroundColor,
                        hintText: 'Create your password',
                        leadingIcon: ImageAssets.pass,
                        leading: true,
                        obscureText: true,
                        textColor: AppColor.textGreyColor2,
                        height: 48,
                        width: 390,
                      ),
                      SizedBox(height: 15),
                      InputTextWidget(
                        onChanged: (e) {},
                        borderColor: AppColor.backgroundColor,
                        hintText: 'Confirm your password',
                        leadingIcon: ImageAssets.pass,
                        leading: true,
                        obscureText: true,
                        textColor: AppColor.textGreyColor2,
                        height: 48,
                        width: 390,
                      ),
                      SizedBox(height: 20),
                      CustomButton(
                        onPress: () async {
                          Get.to(
                                () => VerifyEmailView(),
                            arguments: {'origin': 'AuthView'},
                            transition: Transition.noTransition,
                          );
                        },
                        title: 'SIGN UP',
                        height: 48,
                        width: 390,
                        radius: 100,
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                              color: AppColor.textGreyColor3,
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(
                                SignInView(),
                                transition: Transition.noTransition,
                              );
                            },
                            child: Text(
                              ' Sign In',
                              style: TextStyle(
                                color: AppColor.buttonColor,
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        'or',
                        style: TextStyle(
                          color: AppColor.greyTone1,
                          fontSize: 20,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Continue with',
                        style: TextStyle(
                          color: AppColor.greyTone1,
                          fontSize: 16,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 25),
                      Wrap(
                        spacing: 20,
                        alignment: WrapAlignment.center,
                        children: [
                          SvgPicture.asset(ImageAssets.google, height: 42, width: 78),
                          SvgPicture.asset(ImageAssets.facebook, height: 42, width: 78),
                          SvgPicture.asset(ImageAssets.apple, height: 42, width: 78),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
