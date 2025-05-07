import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jordyn/widgets/custom_button.dart';
import '../../../../res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../controller/explore_controller.dart';

class AccountView extends StatelessWidget {
  final ExploreController controller = Get.find();
  AccountView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ExploreController());
    return Scaffold(
      resizeToAvoidBottomInset: true,

      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                snap: true,
                backgroundColor: AppColor.backgroundColor,
                leading: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(ImageAssets.back_arrow),
                ),
                actions: [],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50.r,
                            backgroundColor: Colors.grey[300],
                            child: ClipOval(
                              child: Image.asset(
                                ImageAssets.image,
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
                                  'Sophia Johnson',
                                  style: TextStyle(
                                    color: AppColor.darkGrey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20.sp,
                                  ),
                                ),
                                SizedBox(height: 10.w),
                                Text(
                                  '@abc_xyz',
                                  style: TextStyle(
                                    color: AppColor.subTitleGrey,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.w),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sit amet venenatis metus',
                        style: TextStyle(
                          color: AppColor.greyTone,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 10.w),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        CustomButton(onPress: ()async{}, title: 'Message',width: 160.w,height: 42.h,radius: 120.r,borderColor: AppColor.greyTone,buttonColor: AppColor.backgroundColor,textColor: AppColor.greyTone,),
                        CustomButton(onPress: ()async{}, title: 'Add Friend',width: 160.w,height: 42.h,radius: 120.r,),
                      ],)
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return buildPost();
                }, childCount: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildPost() {
  return Container(
    height: 545.h,
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
              Text('abc_xyz', style: TextStyle(color: AppColor.greyTone)),
              SizedBox(width: 10.w),
              Text('3s', style: TextStyle(color: AppColor.greyTone)),
            ],
          ),
          trailing: Icon(Icons.more_vert),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sit amet venenatis metus',
            style: TextStyle(color: AppColor.greyTone, fontSize: 16.sp),
          ),
        ),
        SizedBox(height: 10.h),
        Image.asset(ImageAssets.person),
        SizedBox(height: 10.h),
        Row(
          children: [
            SizedBox(width: 20.w),
            SvgPicture.asset(ImageAssets.love, width: 30.w, height: 30.h),
            SizedBox(width: 5.w),
            Text('121', style: TextStyle(color: AppColor.greyTone)),
            SizedBox(width: 20.w),
            GestureDetector(
              // onTap: () {
              //   Get.to(Comment(), transition: Transition.rightToLeft);
              // },
              child: SvgPicture.asset(
                ImageAssets.achieve,
                width: 30.w,
                height: 30.h,
              ),
            ),
            SizedBox(width: 5.w),
            Text('34', style: TextStyle(color: AppColor.greyTone)),
            SizedBox(width: 20.w),
            SvgPicture.asset(ImageAssets.share, width: 35.w, height: 35.h),
            SizedBox(width: 5.w),
            Text('Share', style: TextStyle(color: AppColor.greyTone)),
          ],
        ),
        SizedBox(height: 15.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                    Image.asset(ImageAssets.heart, width: 20.w, height: 20.h),
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
}
