import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:jordyn/app/modules/home/views/selectmemorial.dart';

import '../../../../res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/dialogue.dart';
import '../../../../widgets/input_text_widget.dart';
import '../controllers/home_controller.dart';
import '../widget/custombutton.dart';

class Createpost extends StatelessWidget {
  final HomeController controller = Get.find();
  final ImagePicker _picker = ImagePicker();
  Createpost({super.key});

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      controller.pickedImage.value = File(pickedFile.path);
    }
  }

  Future<void> _pickVideoOrImageFromGallery() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      controller.pickedImage.value = File(file.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, size: 20),
        ),
        title: Text(
          'Create Post',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 25.r,
                  backgroundColor: Colors.grey[300],
                  child: ClipOval(
                    child: Image.asset(
                      ImageAssets.person,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
                title: Text(
                  'Dummy Name',
                  style: TextStyle(
                    color: AppColor.textBlackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              InputTextWidget(
                onChanged: (String value) {},
                onTap: (){
                  FocusScope.of(context).unfocus();
                },
                backgroundColor: Colors.transparent,
                borderColor: Colors.transparent,
                hintText: 'What’s in your mind',
                hintfontSize: 20,
                textColor: AppColor.greyTone,
                width: 1.sw,
                maxLines: 4,
                height: 0.15.sh,
              ),
              Obx(() {
                final file = controller.pickedImage.value;
                return controller.ismemorialselected == true && file == null
                    ? Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20),
                  child: Container(
                    height: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: AppColor.softBeige,
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.r),
                              child: Image.asset(
                                ImageAssets.person,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sophia Anderson',
                              style: TextStyle(
                                color: AppColor.greyTone,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'December 12th, 1992',
                              style: TextStyle(
                                color: AppColor.greyTone,
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              'June 1st, 2024',
                              style: TextStyle(
                                color: AppColor.greyTone,
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
                    : file != null
                    ? Container(
                  height: 300,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child:
                        Image.file(file, fit: BoxFit.cover),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: GestureDetector(
                          onTap: () {
                            controller.pickedImage.value = null;
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              shape: BoxShape.circle,
                            ),
                            padding: EdgeInsets.all(6.w),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                    : SizedBox.shrink();
              }),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              color: AppColor.backgroundColor,
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      Get.to(Selectmemorial(),
                          transition: Transition.rightToLeft);
                      controller.pickedImage.value = null;
                    },
                    leading: Image.asset(ImageAssets.memorial,
                        width: 40, height: 40),
                    title: Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: Text(
                        'Add Memorial',
                        style: TextStyle(
                          color: AppColor.textGreyColor,
                          fontSize: 18,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      _pickVideoOrImageFromGallery();
                      controller.ismemorialselected.value = false;
                    },
                    leading: Image.asset(ImageAssets.photo_videos,
                        width: 35, height: 35),
                    title: Padding(
                      padding: EdgeInsets.only(top: 2.h),
                      child: Text(
                        'Photo/Video',
                        style: TextStyle(
                          color: AppColor.textGreyColor,
                          fontSize: 18,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      _pickImage(ImageSource.camera);
                      controller.ismemorialselected.value = false;
                    },
                    leading: Image.asset(ImageAssets.camera,
                        width: 35.w, height: 35.h),
                    title: Text(
                      'Camera',
                      style: TextStyle(
                        color: AppColor.textGreyColor,
                        fontSize: 18,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CustomButton(
                    title: 'Post',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    onPress: () async {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          child: CenteredDialogWidget(
                            title: 'Post Reported',
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
                    },
                    buttonColor: AppColor.buttonColor,
                    height: 50,
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
