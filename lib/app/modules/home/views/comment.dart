import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/home/controllers/home_controller.dart';
import 'package:jordyn/app/modules/home/views/report.dart';

import '../../../../res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../widget/bottomsheet.dart';

class Comment extends StatelessWidget {
  final HomeController controller = Get.find();
  Comment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, size: 20.sp),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 0.09.sh),
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                children: [
                  // Post section
                  Container(
                    height: 0.5.sh,
                    color: AppColor.backgroundColor,
                    child: Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            radius: 25.r,
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
                          title: Text(
                            'Dummy Name',
                            style: TextStyle(
                              color: AppColor.textBlackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              Text(
                                'abc_xyz',
                                style: TextStyle(color: AppColor.greyTone),
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                '3s',
                                style: TextStyle(color: AppColor.greyTone),
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.transparent,
                                isScrollControlled: true,
                                builder: (_) {
                                  return ReportBottomSheet(
                                    firstOption: ReportOption(
                                      icon: Icons.report_problem,
                                      label: 'Report',
                                      onTap: () {
                                        Navigator.pop(context);
                                        Get.to(
                                          Report(),
                                          transition: Transition.rightToLeft,
                                        );
                                      },
                                    ),
                                    showTwoOptions: false,
                                  );
                                },
                              );
                            },
                            icon: Icon(Icons.more_vert),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sit amet venenatis metus',
                            style: TextStyle(
                              color: AppColor.greyTone,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Image.asset(ImageAssets.person),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            SizedBox(width: 20.w),
                            SvgPicture.asset(
                              ImageAssets.love,
                              width: 30.w,
                              height: 30.h,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              '121',
                              style: TextStyle(color: AppColor.greyTone),
                            ),
                            SizedBox(width: 20.w),
                            SvgPicture.asset(
                              ImageAssets.achieve,
                              width: 30.w,
                              height: 30.h,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              '34',
                              style: TextStyle(color: AppColor.greyTone),
                            ),
                            SizedBox(width: 20.w),
                            SvgPicture.asset(
                              ImageAssets.share,
                              width: 35.w,
                              height: 35.h,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              'Share',
                              style: TextStyle(color: AppColor.greyTone),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Comment list section
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
                                // print('Report tapped');
                              },
                            ),
                            secondOption: ReportOption(
                              icon: Icons.delete,
                              label: 'Delete',
                              onTap: () {
                                Navigator.pop(context);
                                // Add your action here
                                // print('Block tapped');
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
          ),

          // Fixed TextField
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: AppColor.softBeige,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              child: Obx(
                () => TextField(
                  onChanged: controller.onTextChanged,
                  keyboardType: TextInputType.text,
                  cursorColor: AppColor.textColor,
                  style: TextStyle(color: AppColor.textColor),
                  decoration: InputDecoration(
                    hintText: "Add Comment",
                    hintStyle: TextStyle(color: AppColor.textGreyColor),
                    filled: true,
                    fillColor: AppColor.lightBeige,
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(8.0.w),
                      child: CircleAvatar(
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
                    ),
                    suffixIcon:
                        controller.hasText.value
                            ? Padding(
                              padding: EdgeInsets.all(12.w),
                              child: SvgPicture.asset(
                                ImageAssets.send,
                                width: 20.w,
                                height: 20.h,
                              ),
                            )
                            : null,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
