import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jordyn/res/colors/app_color.dart';

class ProfileCardWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final bool showSubtitle1;
  final String? subtitle1;
  final String subtitle2;
  final String subtitle2IconPath;

  const ProfileCardWidget({
    Key? key,
    required this.imagePath,
    required this.title,
    this.showSubtitle1 = false,
    this.subtitle1,
    required this.subtitle2,
    required this.subtitle2IconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: 110.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: AppColor.softBeige,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                height: 80.h,
                width: 80.w,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                clipBehavior: Clip.antiAlias,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColor.greyTone,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (showSubtitle1 && subtitle1 != null)
                  Text(
                    subtitle1!,
                    style: TextStyle(
                      color: AppColor.greyTone,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                Row(
                  children: [
                    Image.asset(
                      subtitle2IconPath,
                      width: 18.w,
                      height: 18.h,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      subtitle2,
                      style: TextStyle(
                        color: AppColor.greyTone,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
