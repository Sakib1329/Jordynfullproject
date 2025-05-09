import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/home/views/navbar.dart';
import 'package:jordyn/app/modules/home/views/schedule.dart';
import 'package:jordyn/res/assets/image_assets.dart';
import 'package:jordyn/res/colors/app_color.dart';
import 'package:jordyn/widgets/custom_button.dart';
import 'package:jordyn/widgets/dialogue.dart';

void showDeleteConfirmationPopup({
  required BuildContext context,
  required String title,
  required String subtitle,
  required VoidCallback onDelete,
  required String arguments,
}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (_) {
      return Dialog(
        backgroundColor: AppColor.background1Color,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColor.textBlackColor,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColor.textGreyColor,
                ),
              ),
              SizedBox(height: 25.h),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      onPress: () async {
                        Navigator.pop(context);
                      },
                      title: 'Cancel',
                      borderColor: AppColor.greyTone,
                      radius: 12,
                      height: 40,
                      buttonColor: AppColor.background1Color,
                      borderShadowColor: AppColor.deepred,
                      textColor: AppColor.greyTone,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child:CustomButton(
                      onPress: () async {
                        Navigator.pop(context);
                        if (arguments == 'HomeView') {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              child: CenteredDialogWidget(
                                title: 'Schedule Post Deleted',
                                horizontalpadding: 2.0.w,
                                verticalpadding: 20.0.h,
                                subtitle: 'Sed dignissim nisl a vehicula fringilla. Nulla faucibus dui tellus, ut dignissim',
                                imageasset: ImageAssets.post_report,
                                backgroundColor: AppColor.backgroundColor,
                                iconBackgroundColor: Colors.transparent,
                                iconColor: AppColor.buttonColor,
                                borderRadius: 30.0.r,
                              ),
                            ),
                          );
                        } else if (arguments == 'MemoryView') {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              child: CenteredDialogWidget(
                                title: 'Memory Deleted',
                                horizontalpadding: 2.0.w,
                                verticalpadding: 20.0.h,
                                subtitle: 'Sed dignissim nisl a vehicula fringilla. Nulla faucibus dui tellus, ut dignissim',
                                imageasset: ImageAssets.post_report,
                                backgroundColor: AppColor.backgroundColor,
                                iconBackgroundColor: Colors.transparent,
                                iconColor: AppColor.buttonColor,
                                borderRadius: 30.0.r,
                              ),
                            ),
                          );
                        } else if (arguments == 'EventView') {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              child: CenteredDialogWidget(
                                title: 'Event Deleted',
                                horizontalpadding: 2.0.w,
                                verticalpadding: 20.0.h,
                                subtitle: 'Sed dignissim nisl a vehicula fringilla. Nulla faucibus dui tellus, ut dignissim',
                                imageasset: ImageAssets.post_report,
                                backgroundColor: AppColor.backgroundColor,
                                iconBackgroundColor: Colors.transparent,
                                iconColor: AppColor.buttonColor,
                                borderRadius: 30.0.r,
                              ),
                            ),
                          );
                        }

                        await Future.delayed(const Duration(seconds: 3), () {
                          try {
                            if (arguments == 'HomeView') {
                              Get.off(() => Schedule(), transition: Transition.fadeIn);
                            } else {
                              Get.off(() => Navigation(), transition: Transition.fadeIn);
                            }
                          } catch (e) {
                            Get.snackbar(
                              'Navigation Error',
                              'Failed to navigate to ${arguments == 'HomeView' ? 'Schedule' : 'Navigation'} screen: $e',
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }
                        });
                      },
                      title: 'Delete',
                      borderColor: AppColor.deepred,
                      radius: 12,
                      height: 40,
                      buttonColor: AppColor.background1Color,
                      borderShadowColor: AppColor.deepred,
                      textColor: AppColor.deepred,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
