import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jordyn/app/modules/chat/controllers/chat_controller.dart';
import 'package:jordyn/res/assets/image_assets.dart';

import '../../../../res/colors/app_color.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/dialogue.dart';

class Blockuser extends StatelessWidget {
  final ChatController controller=Get.find();
  Blockuser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, size: 20.sp),
        ),
        title: Text(
          'Block User',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.0.w,vertical: 20.h),
        child: Column(
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
            SizedBox(height: 30.h,),
            Container(

                child: Image.asset(ImageAssets.text)),
            SizedBox(height: 0.3.sh,),
            CustomButton(
              title: 'Block User',
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
              onPress: () async {
                Get.back();
                controller.isuserblocked.value==false;
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    child: CenteredDialogWidget(
                      title: 'User Blocked',
                      subtitle: 'Sed dignissim nisl a vehicula fringilla. Nulla faucibus dui tellus, ut dignissim',
                      imageasset: ImageAssets.post_report,  // Use your own SVG
                      backgroundColor: AppColor.backgroundColor,           // Custom background
                      iconBackgroundColor: Colors.transparent,
                      iconColor: AppColor.buttonColor,// Custom icon background
                      borderRadius: 30.0,     horizontalpadding: 1.w,
                      // Custom corner radius
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
    );
  }
}