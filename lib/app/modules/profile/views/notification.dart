import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/dialogue.dart';
import '../../../../widgets/input_text_widget.dart';
import '../controllers/profile_controller.dart';
import '../widget/customcontainer.dart';

class NotificationSettings extends StatelessWidget {
  final ProfileController controller=Get.put(ProfileController());
  NotificationSettings ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios_new),

        ),
        title: Text(
          'Notification Setting',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
        ),
        centerTitle: true,
        leadingWidth: 30.w,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(

          children: [
            SizedBox(height: 20.h,),
            Text(
              'Vestibulum sodales pulvinar accumsan raseing rhoncus neque',
              style: TextStyle(
                color: AppColor.textGreyColor,
                fontSize: 20.sp,
                fontFamily: 'Schuyler',
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 20.h,),
            CustomSwitchTile(
              title: 'Lorem ipsum dolor sit',
              controller: controller,
            ),
            CustomSwitchTile(
              title: 'Lorem ipsum dolor sit',
              controller: controller,
            ),
            CustomSwitchTile(
              title: 'Lorem ipsum dolor sit',
              controller: controller,
            ),
            CustomSwitchTile(
              title: 'Lorem ipsum dolor sit',
              controller: controller,
            ),

          ],
        ),
      ),
    );
  }
}
