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
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios, size: 20),
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
                  Container(
                    width: double.infinity,
                    color: AppColor.backgroundColor,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                              fontSize: 18,
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              Text('abc_xyz', style: TextStyle(color: AppColor.greyTone)),
                              SizedBox(width: 10.w),
                              Text('3s', style: TextStyle(color: AppColor.greyTone)),
                            ],
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.more_vert),
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.transparent,
                                isScrollControlled: true,
                                builder: (_) => ReportBottomSheet(
                                  firstOption: ReportOption(
                                    icon: Icons.report_problem,
                                    label: 'Report',
                                    onTap: () {
                                      Navigator.pop(context);
                                      Get.to(() => Report(), transition: Transition.rightToLeft);
                                    },
                                  ),
                                  showTwoOptions: false,
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sit amet venenatis metus',
                            style: TextStyle(color: AppColor.greyTone, fontSize: 16),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        ClipRRect(

                          child: Image.asset(
                            ImageAssets.person,
                            width: double.infinity,
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            SizedBox(width: 20.w),
                            SvgPicture.asset(ImageAssets.love, width: 30, height: 30),
                            SizedBox(width: 5.w),
                            Text('121', style: TextStyle(color: AppColor.greyTone)),
                            SizedBox(width: 20.w),
                            SvgPicture.asset(ImageAssets.achieve, width: 30, height: 30),
                            SizedBox(width: 5.w),
                            Text('34', style: TextStyle(color: AppColor.greyTone)),
                            SizedBox(width: 20.w),
                            SvgPicture.asset(ImageAssets.share, width: 35, height: 35),
                            SizedBox(width: 5.w),
                            Text('Share', style: TextStyle(color: AppColor.greyTone)),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Comment list
                  ListView.builder(
                    itemCount: 50,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onLongPress: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true,
                            builder: (_) => ReportBottomSheet(
                              showTwoOptions: true,
                              firstOption: ReportOption(
                                icon: Icons.edit,
                                label: 'Edit',
                                onTap: () => Navigator.pop(context),
                              ),
                              secondOption: ReportOption(
                                icon: Icons.delete,
                                label: 'Delete',
                                onTap: () => Navigator.pop(context),
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        Text('3s', style: TextStyle(color: AppColor.greyTone, fontSize: 14)),
                                      ],
                                    ),
                                    Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                                      style: TextStyle(color: AppColor.greyTone, fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 25),
                                child: Column(
                                  children: [
                                    Image.asset(ImageAssets.heart, width: 20, height: 20),
                                    Text('2', style: TextStyle(color: AppColor.greyTone)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          // Fixed input
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: AppColor.softBeige,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                      padding: EdgeInsets.all(8.0),
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
                    suffixIcon: controller.hasText.value
                        ? Padding(
                      padding: EdgeInsets.all(12),
                      child: SvgPicture.asset(
                        ImageAssets.send,
                        width: 20,
                        height: 20,
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
