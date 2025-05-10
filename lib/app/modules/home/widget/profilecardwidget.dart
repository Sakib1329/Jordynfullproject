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
    super.key,
    required this.imagePath,
    required this.title,
    this.showSubtitle1 = false,
    this.subtitle1,
    required this.subtitle2,
    required this.subtitle2IconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: 110,
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
                height: 80,
                width: 80,
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
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (showSubtitle1 && subtitle1 != null)
                  Text(
                    subtitle1!,
                    style: TextStyle(
                      color: AppColor.greyTone,
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                Row(
                  children: [
                    Image.asset(
                      subtitle2IconPath,
                      width: 18,
                      height: 18,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      subtitle2,
                      style: TextStyle(
                        color: AppColor.greyTone,
                        fontSize: 20,
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
