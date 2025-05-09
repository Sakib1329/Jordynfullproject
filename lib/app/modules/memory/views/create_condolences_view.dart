import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/memory/controllers/memory_controller.dart';
import 'package:jordyn/app/modules/memory/views/memory_history_view.dart';
import '../../../../res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/input_text_widget.dart';

class CreateCondolencesView extends StatelessWidget {
  final MemoryController controller = Get.find();
  CreateCondolencesView({super.key});

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
                          Get.to(MemoryHistoryView(),transition: Transition.noTransition);
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
