import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/explore/views/event_view.dart';
import 'package:jordyn/app/modules/home/views/navbar.dart';
import 'dart:io';
import 'package:jordyn/app/modules/memory/controllers/memory_controller.dart';
import 'package:jordyn/widgets/dialogue.dart';
import '../../../../res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/input_text_widget.dart';

class AddEventView extends StatelessWidget {
  final MemoryController controller = Get.find();
  AddEventView({super.key});

  @override
  Widget build(BuildContext context) {
    final String origin = Get.arguments?['origin'] as String? ?? 'HomeView';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, size: 20),
        ),
        title: Stack(
          children: [
            if (origin == 'HomeView')
            Text(
              'Create Event ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            if (origin == 'EventView')
            Text(
              'Update Event ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Vestibulum sodales pulvinar accumsan raseing rhoncus neque',
                      style: TextStyle(
                        color: AppColor.greyTone,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Montserrat',
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 15.h),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Upload Event Pictures',
                            style: TextStyle(
                              color: AppColor.textBlackColor,
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Obx(
                            () => SizedBox(
                              height: 127, // Fixed height for the grid
                              child: GridView.builder(
                                scrollDirection:
                                    Axis.horizontal, // Horizontal scrolling
                                physics:
                                    const ClampingScrollPhysics(), // Smooth horizontal scrolling
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1, // 1 row
                                      crossAxisSpacing:
                                          5, // Adjusted to raw values for consistency
                                      mainAxisSpacing: 10,
                                      childAspectRatio: 1, // Square items
                                    ),
                                itemCount:
                                    controller.imagePaths.length +
                                    1, // +1 for the upload button
                                itemBuilder: (context, index) {
                                  if (index == 0) {
                                    // First item is the upload button
                                    return InkWell(
                                      onTap: () {
                                        controller.pickVideoOrImageFromGallery();
                                      },
                                      child: Image.asset(
                                        ImageAssets.upload,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  } else {
                                    // Display uploaded images with remove icon
                                    final imageIndex =
                                        index - 1; // Adjust for the upload button
                                    final imagePath =
                                        controller.imagePaths[imageIndex];
                                    return Container(
                                      height: 127,
                                      width: 118,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            100,
                                          ),
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          Image.file(
                                            File(imagePath),
                                            fit: BoxFit.fill,
                                            width: double.infinity,
                                            height: double.infinity,
                                            errorBuilder: (
                                              context,
                                              error,
                                              stackTrace,
                                            ) {
                                              return Image.asset(
                                                ImageAssets
                                                    .upload, // Fallback if image fails to load
                                                fit: BoxFit.fill,
                                              );
                                            },
                                          ),
                                          Positioned(
                                            top: 5.h,
                                            right: 5.w,
                                            child: InkWell(
                                              onTap: () {
                                                controller.removeImage(
                                                  imageIndex,
                                                );
                                              },
                                              child: Image.asset(
                                                ImageAssets.removeImage,
                                                width: 24,
                                                height: 24,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    InputTextWidget(
                      onChanged: (value) {},
                      backgroundColor: AppColor.textAreaColor,
                      borderColor: Colors.transparent,
                      hintText: 'Event title',
                      hintTextColor: AppColor.greyTone,
                    ),
                    SizedBox(height: 15.h),
                    InputTextWidget(
                      onChanged: (value) {},
                      backgroundColor: AppColor.textAreaColor,
                      borderColor: Colors.transparent,
                      hintText: 'Event date',
                      hintTextColor: AppColor.greyTone,
                      backimageadd: true,
                      backimage: ImageAssets.calender3,
                    ),
                    SizedBox(height: 15),
                    InputTextWidget(
                      onChanged: (value) {},
                      backgroundColor: AppColor.textAreaColor,
                      borderColor: Colors.transparent,
                      hintText: 'Event time',
                      hintTextColor: AppColor.greyTone,
                      backimageadd: true,
                      backimage: ImageAssets.time,
                      height: 48,
                    ),
                    SizedBox(height: 15.h),
                    InputTextWidget(
                      onChanged: (value) {},
                      backgroundColor: AppColor.textAreaColor,
                      borderColor: Colors.transparent,
                      hintText: 'Location',
                      hintTextColor: AppColor.greyTone,
                      backimageadd: true,
                      backimage: ImageAssets.location1,
                      height: 48,
                    ),
                    SizedBox(height: 15.h),
                    InputTextWidget(
                      onChanged: (value) {},
                      backgroundColor: AppColor.textAreaColor,
                      borderColor: Colors.transparent,
                      hintText: 'Event details',
                      hintTextColor: AppColor.greyTone,
                      passwordIcon: ImageAssets.time,
                      height: 148,
                      maxLines: 10,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: 10.h),
                if (origin == 'HomeView')
                CustomButton(
                  title: 'CREATE EVENT',
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
                          title: 'Event Created',
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
                        Get.off(() => const EventView(),transition: Transition.fadeIn,arguments: {'origin': 'EventView'});
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
                if (origin == 'EventView')
                CustomButton(
                  title: 'UPDATE EVENT',
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
                          title: 'Update Created',
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
                SizedBox(height: 30.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
