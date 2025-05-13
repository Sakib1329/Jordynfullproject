import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/home/controllers/home_controller.dart';
import 'package:jordyn/res/assets/image_assets.dart';

import '../../../../res/colors/app_color.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/dialogue.dart';
import '../widget/custombutton.dart';

class Report extends StatelessWidget {
  final HomeController controller = Get.find();

  Report({super.key});

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
          'Report Post',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Vestibulum sodales pulvinar accumsan raseing rhoncus neque',
                style: TextStyle(
                  color: AppColor.textGreyColor,
                  fontSize: 20,
                  fontFamily: 'Schuyler',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 0.1.sh),
            Obx(() => Column(
              children: [
                _buildReportOption(
                    text: 'Inappropriate Content', value: 'Inappropriate Content'),
                _buildReportOption(
                    text: 'Misinformation', value: 'Misinformation'),
                _buildReportOption(
                    text: 'Harassment or Hate Speech', value: 'Harassment or Hate Speech'),
                _buildReportOption(
                    text: 'Privacy Violation', value: 'Privacy Violation'),
                _buildReportOption(
                    text: 'Other', value: 'Other'),
                SizedBox(height: 0.19.sh),
                CustomButton(
                  title: 'Report',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  onPress: () async {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext dialogContext) {
                        // Save dialogContext for closing
                        Future.delayed(Duration(seconds: 2), () {
                          Navigator.of(dialogContext).pop();
                          Get.back();// Close dialog after delay
                        });

                        return Dialog(
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
                            borderRadius: 30.0,
                          ),
                        );
                      },
                    );
                  },


                  buttonColor: controller.isselected.value == false
                      ? AppColor.buttonDisableColor
                      : AppColor.buttonColor,
                  height: 50,
                  radius: 30.r,
                )
              ],
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildReportOption({required String text, required String value}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: CustomActionButton(
        text: text,
        onPressed: () {
          controller.selectedreportype(value);
          if (controller.isselected.value == false) {
            controller.isselected.toggle();
          }
        },
        backgroundColor: controller.selectedreportype.value == value
            ? AppColor.beigeBrown
            : AppColor.softBeige,
        borderColor: Colors.transparent,
        textColor: controller.selectedreportype.value == value
            ? AppColor.whiteTextColor
            : AppColor.greyTone,
      ),
    );
  }
}
