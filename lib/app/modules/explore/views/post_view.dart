import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/home/views/comment.dart';
import 'package:jordyn/res/assets/image_assets.dart';
import 'package:jordyn/res/colors/app_color.dart';

class PostView extends GetView {
  const PostView({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
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
                  title: Text('Dummy Name',
                      style: TextStyle(
                        color: AppColor.textBlackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                  subtitle: Row(
                    children: [
                      Text('abc_xyz', style: TextStyle(color: AppColor.greyTone)),
                      SizedBox(width: 10.w),
                      Text('3s', style: TextStyle(color: AppColor.greyTone)),
                    ],
                  ),
                  trailing: Icon(Icons.more_vert),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sit amet venenatis metus',
                    style: TextStyle(color: AppColor.greyTone, fontSize: 16),
                  ),
                ),
                SizedBox(height: 5.h),
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Image.asset(
                    ImageAssets.person,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    SizedBox(width: 20.w),
                    SvgPicture.asset(ImageAssets.love, width: 30, height: 30),
                    SizedBox(width: 5.w),
                    Text('121', style: TextStyle(color: AppColor.greyTone)),
                    SizedBox(width: 20.w),
                    GestureDetector(
                      onTap: () {
                        Get.to(Comment(), transition: Transition.rightToLeft);
                      },
                      child: SvgPicture.asset(ImageAssets.achieve, width: 30, height: 30),
                    ),
                    SizedBox(width: 5.w),
                    Text('34', style: TextStyle(color: AppColor.greyTone)),
                    SizedBox(width: 20.w),
                    SvgPicture.asset(ImageAssets.share, width: 35, height: 35),
                    SizedBox(width: 5.w),
                    Text('Share', style: TextStyle(color: AppColor.greyTone)),
                  ],
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
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
                                Text('Maryam', style: TextStyle(color: AppColor.darkGrey, fontWeight: FontWeight.w600, fontSize: 16)),
                                SizedBox(width: 10.w),
                                Text('3s', style: TextStyle(color: AppColor.greyTone, fontSize: 16)),
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
              ],
            ),
          );
        },
      ),
    );
  }
}
