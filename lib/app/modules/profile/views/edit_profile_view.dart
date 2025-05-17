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

import '../../auth/controllers/authcameracontroller.dart';
import '../../chat/controllers/bottomsheetcontroller.dart';

class EditProfileView extends GetView<ProfileController> {
  final AuthBottomSheetController as=Get.put(AuthBottomSheetController());
   EditProfileView({super.key});

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
                icon: Icon(Icons.arrow_back_ios, size: 20),
              ),
              title: Text(
                'Edit Profile ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
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
                                    borderRadius: BorderRadius.circular(200),
                                    child: file != null
                                        ? Image.file(
                                      file,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    )
                                        : Container(
                                      width: 100,
                                      height: 100,
                                      color: AppColor.mutedBlueGrey,
                                      child: Image.asset(ImageAssets.avater,fit: BoxFit.cover,),
                                    ),
                                  );
                                }),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: AppColor.buttonColor,
                                      borderRadius: BorderRadius.circular(100.r),
                                    ),
                                    child: Center(
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.camera_alt,
                                          size: 18,
                                          color: AppColor.whiteTextColor,
                                        ),
                                        onPressed: as.getBottomSheet,
                                        padding: EdgeInsets.all(4),
                                        constraints: BoxConstraints(),
                                      ),
                                    ),
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
                          ],
                        ),
                      ),
                    ),
                    CustomButton(
                      title: 'UPDATE',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      onPress: () async {
                        showDialog(
                          context: context,
                          builder:
                              (context) => Dialog(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            child: CenteredDialogWidget(
                              title: 'Profile Updated',
                              horizontalpadding: 2.0,
                              verticalpadding: 20.0,
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
