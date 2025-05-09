import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../res/assets/image_assets.dart';

class Viewall extends StatelessWidget {
  const Viewall({super.key});

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
          'Gallery',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
        child: GridView.builder(
          padding: EdgeInsets.symmetric(vertical: 8.h),

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Adjust the number of columns
            crossAxisSpacing: 8.w,
            mainAxisSpacing: 8.h,
            childAspectRatio: 0.6, // Adjust if the image isn't square
          ),
          itemCount: 20,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Container(
                height: 500,
                width: 500,
                color: Colors.black,
                child: Image.asset(
                  ImageAssets.person2,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),

    );
  }
}
