import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/auth/controllers/auth_controller.dart';
import 'package:jordyn/app/modules/auth/controllers/authcameracontroller.dart';
import 'package:jordyn/app/modules/auth/views/link_social_view.dart';
import 'package:jordyn/res/assets/image_assets.dart';
import 'package:jordyn/res/colors/app_color.dart';
import 'package:jordyn/widgets/custom_button.dart';
import 'package:jordyn/widgets/input_text_widget.dart';

class CreateProfileView extends GetView<AuthController> {
  final AuthBottomSheetController as=Get.put(AuthBottomSheetController());
   CreateProfileView({super.key});

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
                            SizedBox(height: 62),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Create your Profile',
                                  style: TextStyle(
                                    color: AppColor.buttonColor,
                                    fontSize: 24,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 20),
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
                            Stack(
                              children: [
                                Obx(() {
                                  final file = as.pickedImage.value;

                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(200.r),
                                    child: file != null
                                        ? Image.file(
                                      file,
                                      width: 100.w,
                                      height: 100.w,
                                      fit: BoxFit.cover,
                                    )
                                        : Container(
                                      width: 100.w,
                                      height: 100.w,
                                      color: AppColor.mutedBlueGrey,
                                      child: Image.asset(ImageAssets.avater,fit: BoxFit.cover,),
                                    ),
                                  );
                                }),
                                Positioned(
                                  bottom: 0.h,
                                  right: 0.w,
                                  child: Container(
                                    width: 30.w,
                                    height: 30.w,
                                    decoration: BoxDecoration(
                                      color: AppColor.buttonColor,
                                      borderRadius: BorderRadius.circular(100.r),
                                    ),
                                    child: Center(
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.camera_alt,
                                          size: 18.sp,
                                          color: AppColor.whiteTextColor,
                                        ),
                                        onPressed: as.getBottomSheet,
                                        padding: EdgeInsets.all(4.w),
                                        constraints: BoxConstraints(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            InputTextWidget(
                              onChanged: (e) {},
                              borderColor: AppColor.backgroundColor,
                              hintText: 'Enter your name',
                              textColor: AppColor.textGreyColor2,
                              height: 48,
                              width: 390,
                            ),
                            SizedBox(height: 15),
                            InputTextWidget(
                              onChanged: (e) {},
                              borderColor: AppColor.backgroundColor,
                              hintText: 'Create your user name',
                              textColor: AppColor.textGreyColor2,
                              height: 48,
                              width: 390,
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vitae libero libero. Quisque viverra semper eros.',
                              style: TextStyle(
                                color: AppColor.textGreyColor3,
                                fontSize: 16,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 20),
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
                      title: 'Next',
                      height: 48,
                      width: 390,
                      radius: 100,
                    ),
                    SizedBox(height: 15),
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
