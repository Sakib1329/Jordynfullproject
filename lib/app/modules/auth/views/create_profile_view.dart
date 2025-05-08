import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/auth/controllers/auth_controller.dart';
import 'package:jordyn/app/modules/auth/views/link_social_view.dart';
import 'package:jordyn/res/assets/image_assets.dart';
import 'package:jordyn/res/colors/app_color.dart';
import 'package:jordyn/widgets/custom_button.dart';
import 'package:jordyn/widgets/input_text_widget.dart';

class CreateProfileView extends GetView<AuthController> {
  const CreateProfileView({super.key});

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
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 82.h),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Create your Profile',
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
                            Stack(
                              children: [
                                Center(child: Image.asset(ImageAssets.avater)),
                                Positioned(
                                  bottom: 5.h,
                                  right: 140.w,
                                  child: Center(
                                    child: Image.asset(ImageAssets.camera1),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            InputTextWidget(
                              onChanged: (e) {},
                              borderColor: AppColor.backgroundColor,
                              hintText: 'Enter your name',
                              textColor: AppColor.textGreyColor2,
                              height: 48.h,
                              width: 390.w,
                            ),
                            SizedBox(height: 15.h),
                            InputTextWidget(
                              onChanged: (e) {},
                              borderColor: AppColor.backgroundColor,
                              hintText: 'Create your user name',
                              textColor: AppColor.textGreyColor2,
                              height: 48.h,
                              width: 390.w,
                            ),
                            SizedBox(height: 15.h),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vitae libero libero. Quisque viverra semper eros.',
                              style: TextStyle(
                                color: AppColor.textGreyColor3,
                                fontSize: 16.sp,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    CustomButton(
                      onPress: () async {
                        Get.to(
                          LinkSocialView(),
                          transition: Transition.noTransition,
                        );
                      },
                      title: 'SING UP',
                      height: 48.h,
                      width: 390.w,
                      radius: 100,
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
