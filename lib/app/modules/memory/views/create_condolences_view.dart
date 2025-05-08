import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:jordyn/app/modules/memory/controllers/memory_controller.dart';
import '../../../../res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/deleteconfirmationwidget.dart';
import '../../../../widgets/dialogue.dart';
import '../../../../widgets/input_text_widget.dart';

class CreateCondolencesView extends StatelessWidget {
  final MemoryController controller = Get.find();
  final ImagePicker _picker = ImagePicker();
  CreateCondolencesView({super.key});

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      controller.pickedImageschedule.value = File(pickedFile.path);
    }
  }

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
          'Add Condolence message',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: Text(
                    'Vestibulum sodales pulvinar accumsan raseing rhoncus neque',
                    style: TextStyle(
                      color: AppColor.greyTone,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Montserrat',
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 15.h,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10.h),
                      InputTextWidget(
                        onChanged: (value) {},
                        backgroundColor: AppColor.textAreaColor,
                        borderColor: Colors.transparent,
                        hintText: 'Add condolence message',
                        hintTextColor: AppColor.greyTone,
                        passwordIcon: ImageAssets.time,
                        height: 148.h,
                        maxLines: 10,
                      ),
                      SizedBox(height: 150.h),
                      CustomButton(
                        title: 'Save',
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        onPress: () async {
                          showDialog(
                            context: context,
                            builder:
                                (context) => Dialog(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                  child: CenteredDialogWidget(
                                    title: 'Schedule Post Deleted',
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
                        },
                        buttonColor: AppColor.buttonColor,
                        height: 50.h,
                        radius: 30.r,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
