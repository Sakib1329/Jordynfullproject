import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/memory/controllers/memory_controller.dart';
import 'package:jordyn/app/modules/memory/views/memory_details_view.dart';
import 'package:jordyn/res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../widgets/custom_button.dart';

class QrCodeView extends StatelessWidget {
  final MemoryController controller = Get.find();
  QrCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, size: 20),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Vestibulum sodales pulvinar accumsan raseing rhoncus neque',
                style: TextStyle(
                  color: AppColor.greyTone,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Montserrat',
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height:80.h),
              Image.asset(ImageAssets.qrCode),
              SizedBox(height: 80.h),

              Column(
                children: [
                  Row(
                    spacing: 30.w,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(ImageAssets.qrshare),
                      Image.asset(ImageAssets.qrdownload),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(height: 40.h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
