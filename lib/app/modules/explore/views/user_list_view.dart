import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:jordyn/app/modules/explore/views/account_view.dart';
import 'package:jordyn/app/modules/home/widget/bottomsheet.dart';
import 'package:jordyn/res/assets/image_assets.dart';
import 'package:jordyn/res/colors/app_color.dart';

class UserListView extends GetView {
   UserListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.09.sh),
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(AccountView(),transition: Transition.rightToLeft);
              },
              child: ListView.builder(
                itemCount: 50,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 13.h,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 20.r,
                          backgroundColor: Colors.grey[300],
                          child: ClipOval(
                            child: Image.asset(
                              ImageAssets.avater1,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Alina',
                                style: TextStyle(
                                  color: AppColor.darkGrey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                '@alina772',
                                style: TextStyle(
                                  color: AppColor.greyTone,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
