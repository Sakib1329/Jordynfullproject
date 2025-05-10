import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/auth/views/link_social_view.dart';
import 'package:jordyn/app/modules/home/views/navbar.dart';
import 'package:jordyn/app/modules/profile/controllers/profile_controller.dart';
import 'package:jordyn/app/modules/profile/views/profile.dart';
import 'package:jordyn/res/assets/image_assets.dart';
import 'package:jordyn/res/colors/app_color.dart';
import 'package:jordyn/widgets/custom_button.dart';
import 'package:jordyn/widgets/dialogue.dart';
import 'package:jordyn/widgets/input_text_widget.dart';

class EditProfileView extends GetView<ProfileController> {
  const EditProfileView({super.key});

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
            appBar: AppBar(
              leading:  IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios, size: 20.sp),
              ),
              title: Text(
                'Edit Profile ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
              ),
              centerTitle: true,
            ),
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                Center(child: Image.asset(ImageAssets.image1,height: 124.h,width: 124.w,)),
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
                      title: 'Update Event',
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      onPress: () async {
                        showDialog(
                          context: context,
                          builder:
                              (context) => Dialog(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            child: CenteredDialogWidget(
                              title: 'Profile Updated',
                              horizontalpadding: 2.0.w,
                              verticalpadding: 20.0.h,
                              subtitle:
                              'Sed dignissim nisl a vehicula fringilla. Nulla faucibus dui tellus, ut dignissim',
                              imageasset: ImageAssets.post_report,
                              backgroundColor: AppColor.backgroundColor,
                              iconBackgroundColor: Colors.transparent,
                              iconColor: AppColor.buttonColor,
                              borderRadius: 30.0.r,
                            ),
                          ),
                        );
                        Future.delayed(const Duration(seconds: 2), () {
                          try {
                            Get.off(() =>  Navigation(),transition: Transition.fadeIn,);
                          } catch (e) {
                            Get.snackbar(
                              'Navigation Error',
                              'Failed to navigate to Event screen: $e',
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }
                        });
                      },
                      buttonColor: AppColor.buttonColor,
                      height: 48,
                      width: double.infinity,
                      radius: 30.r,
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
