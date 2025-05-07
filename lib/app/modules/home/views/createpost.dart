import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          icon: Icon(Icons.arrow_back_ios, size: 20.sp),
        ),
        title: Text(
          'Create Post',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
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
                    fontSize: 18.sp,
                  ),
                ),
              ),
              InputTextWidget(
                onChanged: (String value) {},
                borderColor: Colors.transparent,
                hintText: 'What’s in your mind',
                hintfontSize: 20.sp,
                textColor: AppColor.greyTone,
                width: 1.sw,
                maxLines: 4,
                height: 0.15.sh,
              ),
              Obx(() {
                final file = controller.pickedImage.value;
                return controller.ismemorialselected==true?file==null ?Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20,),
                  child: Container(
                    height: 110,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColor.softBeige,
                        )
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
                                borderRadius: BorderRadius.circular(12),
                              ),
                              clipBehavior: Clip.antiAlias, // Enables clipping
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  ImageAssets.person,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                        ),
                        SizedBox(width: 10,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sophia Anderson',
                              style: TextStyle(color: AppColor.greyTone, fontSize: 22,fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'December 12th, 1992',
                              style: TextStyle(color: AppColor.greyTone, fontSize: 20,fontWeight: FontWeight.w300),
                            ),
                            Text(
                              'June 1st, 2024',
                              style: TextStyle(color: AppColor.greyTone, fontSize: 20,fontWeight: FontWeight.w300),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ) :Container(
                  height: 300.h,
                  width: double.infinity,
                  child: file != null
                      ? Image.file(file, fit: BoxFit.cover)
                      : null,
                ): Container(
                  height: 300.h,
                  width: double.infinity,
                  child: file != null
                      ? Image.file(file, fit: BoxFit.cover)
                      : null,
                );
              }),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 10.h,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              child: Column(
                children: [
                  ListTile(
                    onTap: (){Get.to(Selectmemorial(),transition: Transition.rightToLeft);
                      controller.pickedImage.value=null;
                      },
                    leading: Image.asset(ImageAssets.memorial, width: 40.w, height: 40.h),
                    title: Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: Text(
                        'Add Memorial',
                        style: TextStyle(
                          color: AppColor.textGreyColor,
                          fontSize: 18.sp,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                   onTap:(){ _pickVideoOrImageFromGallery();
                     controller.ismemorialselected.value=false;
                     },
                    leading: Image.asset(ImageAssets.photo_videos, width: 35.w, height: 35.h),
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
                  Divider(),
                  ListTile(
                    onTap: () { _pickImage(ImageSource.camera);
                    controller.ismemorialselected.value=false;

                      },
                    leading: Image.asset(ImageAssets.camera, width: 35.w, height: 35.h),
                    title: Text(
                      'Camera',
                      style: TextStyle(
                        color: AppColor.textGreyColor,
                        fontSize: 18.sp,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CustomButton(
                    title: 'Post',
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
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
                            imageasset: ImageAssets.post_report2,
                            backgroundColor: AppColor.backgroundColor,
                            iconBackgroundColor: Colors.transparent,
                            iconColor: AppColor.buttonColor,
                            borderRadius: 30.0.r,
                          ),
                        ),
                      );
                    },
                    buttonColor: AppColor.buttonColor,
                    height: 50.h,
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
