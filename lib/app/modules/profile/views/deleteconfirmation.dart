import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jordyn/res/assets/image_assets.dart';
import 'package:jordyn/res/colors/app_color.dart';

class Deleteconfirmation extends StatelessWidget {
  const Deleteconfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.buttonColor,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColor.buttonColor,
        child: Column(
          children: [
            SizedBox(height: 0.17.sh,),
            Container(
                width: 350.w,
                height: 350.h,
                child: Image.asset(ImageAssets.img)),
          ],
        ),
      ),
    );
  }
}
