import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:jordyn/app/modules/home/widget/bottomsheet.dart';
import 'package:jordyn/res/assets/image_assets.dart';
import 'package:jordyn/res/colors/app_color.dart';

class MemoryListView extends GetView {
   MemoryListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.09.sh),
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            GestureDetector(
              onLongPress: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  builder: (_) {
                    return ReportBottomSheet(
                      showTwoOptions: true,
                      firstOption: ReportOption(
                        icon: Icons.edit,
                        label: 'Edit',
                        onTap: () {
                          Navigator.pop(context);
                          // Add your action here
                          print('Report tapped');
                        },
                      ),
                      secondOption: ReportOption(
                        icon: Icons.delete,
                        label: 'Delete',
                        onTap: () {
                          Navigator.pop(context);
                          // Add your action here
                          print('Block tapped');
                        },
                      ),
                    );
                  },
                );
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
                      vertical: 10.h,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 20.r,
                          backgroundColor: Colors.grey[300],
                          child: ClipOval(
                            child: Image.asset(
                              ImageAssets.person,
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
                              Row(
                                children: [
                                  Text(
                                    'Maryam',
                                    style: TextStyle(
                                      color: AppColor.darkGrey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  Text(
                                    '3s',
                                    style: TextStyle(
                                      color: AppColor.greyTone,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                                style: TextStyle(
                                  color: AppColor.greyTone,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 25.h),
                          child: Column(
                            children: [
                              Image.asset(
                                ImageAssets.heart,
                                width: 20.w,
                                height: 20.h,
                              ),
                              Text(
                                '2',
                                style: TextStyle(
                                  color: AppColor.greyTone,
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
