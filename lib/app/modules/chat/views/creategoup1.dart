import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jordyn/app/modules/chat/views/groupchat.dart';
import 'package:jordyn/app/modules/chat/views/personalchat.dart';
import 'package:jordyn/res/assets/image_assets.dart';

import '../../../../res/colors/app_color.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/input_text_widget.dart';
import '../controllers/bottomsheetcontroller.dart';
import '../controllers/chat_controller.dart';

class Creategoup1 extends StatelessWidget {
  final BottomSheetController bs=Get.put(BottomSheetController());
  final ChatController controller = Get.find();
   Creategoup1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios_new),

        ),
        title: Text(
          'Create Group',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
        ),
        centerTitle: true,
        leadingWidth: 30.w,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Vestibulum sodales pulvinar accumsan raseing rhoncus neque',
              style: TextStyle(
                color: AppColor.textGreyColor,
                fontSize: 20.sp,
                fontFamily: 'Schuyler',
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 15.h,),
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: 60.r,
                    backgroundColor: Colors.white24,
                    child: Obx(() {
                      final file = bs.pickedImage.value;

                      return ClipRRect(
                        borderRadius: BorderRadius.circular(60.r),
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
                          child: Image.asset(ImageAssets.group),
                        ),
                      );
                    }),
                  ),
                  Positioned(
                    bottom: 8.h,
                    right: 10.w,
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
                          onPressed: bs.getBottomSheet,
                          padding: EdgeInsets.all(4.w),
                          constraints: BoxConstraints(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.h,),
            InputTextWidget(

              onChanged: (value) {

              },

              borderColor: AppColor.backgroundColor,
              hintText: 'Create group name',
              hintTextColor: AppColor.textGreyColor2,
              textColor: AppColor.textGreyColor2,

              height: 48.h,
            ),
            SizedBox(height: 10.h,),
            InputTextWidget(

              onChanged: (value) {

              },

              borderColor: AppColor.backgroundColor,
              hintText: 'Group bio',
              hintTextColor: AppColor.textGreyColor2,
              textColor: AppColor.textGreyColor2,
maxLines: 10,
              height: 150.h,
            ),
            SizedBox(height: 20.h,),
            Text('Group Type',style: TextStyle(
              color: AppColor.textBlackColor,
              fontSize: 18.sp
            ),),
            SizedBox(height: 10.h,),
            Obx(() => Column(
              children: [
                groupOption("Public"),

                groupOption("Private"),
              ],
            )),
            SizedBox(height: 0.2.sh,),
            CustomButton(
              title: 'Create',
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
              onPress: () async {
                Get.to(Groupchat(name: 'Friends'),transition: Transition.rightToLeft);
              },
              buttonColor: AppColor.buttonColor,
              height: 50.h,
              radius: 30.r,
            ),
          ],
        ),
      ),
    );
  }
  Widget groupOption(String label) {
    bool isSelected = controller.selectedGroupType.value == label;
    return GestureDetector(
      onTap: () => controller.selectedGroupType.value = label,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),

        ),
        child: Row(
          children: [
            Container(
              width: 20.w,
              height: 20.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColor.textTitleColor: Colors.grey,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                child: Container(
                  width: 12.w,
                  height: 12.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:AppColor.textTitleColor
                  ),
                ),
              )
                  : null,
            ),
            SizedBox(width: 12.w),
            Text(
              label,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.greyTone,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

