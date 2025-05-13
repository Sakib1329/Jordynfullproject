import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/auth/views/verify_email_view.dart';
import 'package:jordyn/res/assets/image_assets.dart';
import 'package:jordyn/res/colors/app_color.dart';
import 'package:jordyn/widgets/custom_button.dart';
import 'package:jordyn/widgets/input_text_widget.dart';
import '../controllers/auth_controller.dart';

class ForgetView extends GetView<AuthController> {
  const ForgetView({super.key});

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
                  padding:  EdgeInsets.symmetric(horizontal: 0.05.sw),
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
                            'Forgot Password',
                            style: TextStyle(
                              color: AppColor.buttonColor,
                              fontSize: 24,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 20.h),
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
                      SizedBox(height: 20.h),
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
                      SizedBox(height: 60.h),
                      CustomButton(
                        onPress: () async {
                          Get.to(
                                () => VerifyEmailView(),
                            arguments: {'origin': 'ForgetView'},
                            transition: Transition.noTransition,
                          );
                        },
                        title: 'Next',
                        height: 48,
                        width: 390,
                        radius: 100,
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
