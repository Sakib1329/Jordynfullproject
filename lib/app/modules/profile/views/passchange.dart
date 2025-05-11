import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:jordyn/res/assets/image_assets.dart';
import 'package:jordyn/res/colors/app_color.dart';
import 'package:jordyn/widgets/custom_button.dart';
import 'package:jordyn/widgets/input_text_widget.dart';
import '../../../../widgets/dialogue.dart';
import '../../auth/controllers/auth_controller.dart';


class Passchange extends GetView<AuthController> {
 const Passchange({super.key});

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
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(Icons.arrow_back_ios_new),

              ),
              title: Text(
                'Change Password',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
              ),
              centerTitle: true,
              leadingWidth: 30.w,
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    SizedBox(height: 20.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(height: 20.h),
                        Text(
                          'Vestibulum sodales pulvinar accumsan raseing rhoncus neque',
                          style: TextStyle(
                            color: AppColor.textGreyColor2,
                            fontSize: 18.sp,
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
                      hintText: 'Enter your password',
                      leadingIcon: ImageAssets.pass,
                      leading: true,
                      obscureText: true,
                      textColor: AppColor.textGreyColor2,
                      height: 48.h,
                      width: 390.w,
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
                        Get.back();
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            child: CenteredDialogWidget(
                              title: 'Password Changed',
                              subtitle: 'Sed dignissim nisl a vehicula fringilla. Nulla faucibus dui tellus, ut dignissim',
                              imageasset: ImageAssets.post_report,  // Use your own SVG
                              backgroundColor: AppColor.backgroundColor,           // Custom background
                              iconBackgroundColor: Colors.transparent,
                              iconColor: AppColor.buttonColor,// Custom icon background
                              borderRadius: 30.0,
                              horizontalpadding: 2.w,// Custom corner radius
                            ),
                          ),
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
