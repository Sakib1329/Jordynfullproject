import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jordyn/res/assets/image_assets.dart';
import 'package:jordyn/res/colors/app_color.dart';

class EventView extends GetView {
  const EventView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(ImageAssets.background),
              Positioned(
                top: 75.h,
                left: 20.w,
                child: InkWell(
                  onTap: (){Get.back();},
                  child: Container(
                    height: 35.h,
                    width: 35.w,
                    decoration: ShapeDecoration(
                      color: AppColor.backgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: AppColor.backgroundColor),
                      ),
                    ),
                    child: Image.asset(ImageAssets.back_arrow),
                  ),
                ),
              ),
              Positioned(
                top: 75.h,
                right: 20.w,
                child: Container(
                  height: 35.h,
                  width: 35.w,
                  decoration: ShapeDecoration(
                    color: AppColor.backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(color: AppColor.backgroundColor),
                    ),
                  ),
                  padding: EdgeInsets.all(6.sp),
                  child: Image.asset(ImageAssets.share1),
                ),
              ),
              Positioned(
                top: 260.h,
                left: 20.w,
                child: Text(
                  '1/10',
                  style: TextStyle(
                    color: AppColor.whiteTextColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dummy Event NAAME',
                  style: TextStyle(
                    color: AppColor.buttonColor,
                    fontSize: 20.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 15.h),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vitae libero libero. Quisque viverra semper eros in ultrices. Cras vel augue tristique, gravida nulla a, blandit ex.',
                  style: TextStyle(
                    color: AppColor.textGreyColor2,
                    fontSize: 16.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  'Date & Time',
                  style: TextStyle(
                    color: AppColor.buttonColor,
                    fontSize: 16.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 15.h),

              ],
            ),
          ), Container(
            height: 52.h,
            width: double.infinity,
            decoration: ShapeDecoration(
              color: AppColor.textAreaColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
                side: BorderSide(color: AppColor.backgroundColor),
              ),
            ),
            padding: EdgeInsets.only(left: 20, right: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 10.w,
                  children: [
                    Image.asset(
                      ImageAssets.calender,
                      height: 20.h,
                      width: 20.w,
                    ),
                    Text(
                      '12 Jun 2025',
                      style: TextStyle(
                        color: AppColor.darkGrey,
                        fontSize: 14.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: 10.w,
                  children: [
                    Image.asset(
                      ImageAssets.clock,
                      height: 20.h,
                      width: 20.w,
                    ),
                    Text(
                      '02:30 PM',
                      style: TextStyle(
                        color: AppColor.darkGrey,
                        fontSize: 14.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Location',
                  style: TextStyle(
                    color: AppColor.buttonColor,
                    fontSize: 16.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 15.h),
                Row(
                  children: [
                    Image.asset(
                      ImageAssets.location,
                      height: 20.h,
                      width: 20.w,
                    ),
                    Text(
                      '47 W 13th St, New York, NY 10011, Dubai',
                      style: TextStyle(
                        color: AppColor.greyTone,
                        fontSize: 14.sp,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
