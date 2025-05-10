import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jordyn/res/colors/app_color.dart';
import 'package:jordyn/widgets/custom_button.dart';

void showDeleteConfirmationPopup({
  required BuildContext context,
  required String title,
  required String subtitle,
  required VoidCallback onDelete,
}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (_) {
      return Dialog(
        backgroundColor: AppColor.background1Color,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
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
                    child: CustomButton(onPress: ()async{
                      Navigator.of(context).pop();
                    }, title: 'Cancel',
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
                    child: CustomButton(onPress: ()async{
                      Navigator.of(context).pop(); // Close the dialog first
                      onDelete();
                    }, title: 'Delete',
      borderColor: AppColor.deepred,
                      radius: 12,

height: 40,
buttonColor: AppColor.background1Color,
                      borderShadowColor: AppColor.deepred,
                      textColor: AppColor.deepred,

      ),

                    ),

                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
