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
          icon: Icon(Icons.arrow_back_ios, size: 20.sp),
        ),
        title: Text(
          'Report Post',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              'Vestibulum sodales pulvinar accumsan raseing rhoncus neque',
              style: TextStyle(
                color: AppColor.textGreyColor,
                fontSize: 20.sp,
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
                fontSize: 20.sp,
                onPress: () async {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      child: CenteredDialogWidget(
                        title: 'Post Reported',
                        subtitle: 'Sed dignissim nisl a vehicula fringilla. Nulla faucibus dui tellus, ut dignissim',
                        imageasset: ImageAssets.post_report,  // Use your own SVG
                        backgroundColor: AppColor.backgroundColor,           // Custom background
                        iconBackgroundColor: Colors.transparent,
                        iconColor: AppColor.buttonColor,// Custom icon background
                        borderRadius: 30.0,                      // Custom corner radius
                      ),
                    ),
                  );
                },
                buttonColor: controller.isselected.value == false
                    ? AppColor.buttonDisableColor
                    : AppColor.buttonColor,
                height: 50.h,
                radius: 30.r,
              )
            ],
          )),
        ],
      ),
    );
  }

  Widget _buildReportOption({required String text, required String value}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
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
