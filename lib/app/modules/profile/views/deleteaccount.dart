import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jordyn/app/modules/profile/views/deleteconfirmation.dart';
import 'package:jordyn/res/assets/image_assets.dart';

import '../../../../res/colors/app_color.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/input_text_widget.dart';

class Deleteaccount extends StatelessWidget {
  const Deleteaccount({super.key});

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
          'Privacy',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h,),
            SizedBox(
                width: 0.6.sw,
                child: Image.asset(ImageAssets.deletedetails1)),
            SizedBox(height: 20.h,),
            SizedBox(child: Image.asset(ImageAssets.deletedetails2)),
            SizedBox(height: 20.h,),
            InputTextWidget(
              onChanged: (e) {},
              borderColor: AppColor.backgroundColor,
              hintText: 'Enter your password',
              leadingIcon: ImageAssets.pass,
              leading: true,
              obscureText: true,
              textColor: AppColor.textGreyColor2,
              height: 48.h,
              width: 390.w,
            ),
            SizedBox(height: 0.3.sh,),
            CustomButton(
              onPress: () async {
Get.to(Deleteconfirmation(),transition: Transition.rightToLeft);

              },
              title: 'Delete Acoount',
              height: 48.h,
              width: 390.w,
              radius: 100,
              buttonColor: AppColor.deepred,
            ),
          ],
        ),
      ),
    );
  }
}
