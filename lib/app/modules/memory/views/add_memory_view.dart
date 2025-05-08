import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:jordyn/app/modules/memory/controllers/memory_controller.dart';
import 'package:jordyn/app/modules/memory/views/memory_history_view.dart';
import '../../../../res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/dialogue.dart';
import '../../../../widgets/input_text_widget.dart';

class AddMemoryView extends StatelessWidget {
  final MemoryController controller = Get.find();
  final ImagePicker _picker = ImagePicker();
  AddMemoryView({super.key});

  Future<void> _pickVideoOrImageFromGallery() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      controller.pickedImageschedule.value = File(file.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, size: 20.sp),
        ),
        title: Text(
          'Add Memory ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Vestibulum sodales pulvinar accumsan raseing rhoncus neque',
                    style: TextStyle(
                      color: AppColor.greyTone,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Montserrat',
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 15.h),
                  InputTextWidget(
                    onChanged: (value) {},
                    backgroundColor: AppColor.textAreaColor,
                    borderColor: Colors.transparent,
                    hintText: 'Title for this memory',
                    hintTextColor: AppColor.greyTone,
                    passwordIcon: ImageAssets.calender3,
                  ),
                  SizedBox(height: 10.h),
                  InputTextWidget(
                    onChanged: (value) {},
                    backgroundColor: AppColor.textAreaColor,
                    borderColor: Colors.transparent,
                    hintText: 'Date of memory',
                    hintTextColor: AppColor.greyTone,
                    passwordIcon: ImageAssets.time,
                  ),
                  SizedBox(height: 10.h),
                  InputTextWidget(
                    onChanged: (value) {},
                    backgroundColor: AppColor.textAreaColor,
                    borderColor: Colors.transparent,
                    hintText: 'Description',
                    hintTextColor: AppColor.greyTone,
                    passwordIcon: ImageAssets.time,
                    height: 148.h,
                    maxLines: 10,
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    'Upload Media',
                    style: TextStyle(
                      color: AppColor.darkGrey,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  SizedBox(height: 8.h),
                  ListTile(
                    onTap: () {
                      _pickVideoOrImageFromGallery();
                      controller.ismemorialselected.value = false;
                    },
                    leading: Image.asset(
                      ImageAssets.photo_videos,
                      width: 35.w,
                      height: 35.h,
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(top: 2.h),
                      child: Text(
                        'Photo/Video',
                        style: TextStyle(
                          color: AppColor.textGreyColor,
                          fontSize: 18.sp,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CustomButton(
                    title: 'Save',
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    onPress: () async {Get.to(MemoryHistoryView(),transition: Transition.noTransition);
                    },
                    buttonColor: AppColor.buttonColor,
                    height: 48.h,
                    width: double.infinity,
                    radius: 30.r,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
