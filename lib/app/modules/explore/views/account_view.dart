import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/explore/views/event_list_view.dart';
import 'package:jordyn/app/modules/memory/views/memorial_view.dart';
import 'package:jordyn/app/modules/explore/views/post_view.dart';
import 'package:jordyn/app/modules/profile/views/edit_profile_view.dart';
import 'package:jordyn/app/modules/profile/views/friend_list_view.dart';
import 'package:jordyn/app/modules/profile/views/settings.dart';
import 'package:jordyn/widgets/custom_button.dart';
import '../../../../res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../controller/explore_controller.dart';

class AccountView extends StatelessWidget {
  final List<String?> arguments;
  final ExploreController controller = Get.find();
  AccountView({super.key, required this.arguments});
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
                automaticallyImplyLeading: false,
                actions: [
                  if (arguments[1] == 'myprofile')
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(Settings(),transition: Transition.rightToLeft);
                          },
                          child: Image.asset(ImageAssets.settings),
                        ),
                      ],
                    ),
                  ),
                  if (arguments[1] == 'othersprofile')
                  Padding(
                    padding: const EdgeInsets.only(right: 368.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                           Get.back();
                          },
                          child:  Icon(Icons.arrow_back_ios_new, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
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
                                SizedBox(height: 10.h),
                                Row(
                                  children: [
                                    Text(
                                      '@abc_xyz',
                                      style: TextStyle(
                                        color: AppColor.subTitleGrey,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    if (arguments[1] == 'myprofile')
                                      Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Get.to(
                                                FriendListView(),
                                                transition:
                                                    Transition.rightToLeft,
                                              );
                                            },
                                            child: Text(
                                              '200 Friends',
                                              style: TextStyle(
                                                color: AppColor.subTitleGrey,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Montaga',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
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
                      if (arguments[1] == 'othersprofile')
                        Column(
                          children: [
                            SizedBox(height: 20.w),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomButton(
                                  onPress: () async {},
                                  title: 'Message',
                                  width: 160.w,
                                  height: 42.h,
                                  radius: 120.r,
                                  fontSize: 18.sp,
                                  borderColor: AppColor.greyTone,
                                  buttonColor: AppColor.backgroundColor,
                                  textColor: AppColor.greyTone,
                                ),
                                CustomButton(
                                  onPress: () async {},
                                  title: 'Add Friend',
                                  fontSize: 18.sp,
                                  width: 160.w,
                                  height: 42.h,
                                  radius: 120.r,
                                ),
                              ],
                            ),
                          ],
                        ),
                      if (arguments[1] == 'myprofile')
                        Column(
                          children: [
                            SizedBox(height: 20.w),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomButton(
                                  onPress: () async {
                                    Get.to(
                                      EditProfileView(),
                                      transition: Transition.noTransition,
                                    );
                                  },
                                  title: 'Edit Profile',
                                  width: 160.w,
                                  height: 42.h,
                                  radius: 120.r,
                                  fontSize: 18.sp,
                                  borderColor: AppColor.greyTone,
                                  buttonColor: AppColor.backgroundColor,
                                  textColor: AppColor.greyTone,
                                ),
                                CustomButton(
                                  onPress: () async {},
                                  title: 'Share Profile',
                                  fontSize: 18.sp,
                                  width: 160.w,
                                  height: 42.h,
                                  radius: 120.r,
                                ),
                              ],
                            ),
                          ],
                        ),

                      SizedBox(height: 20.w),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: Obx(
                              () => GestureDetector(
                                onTap: () {
                                  controller.setAccountSelectedTab('Memorial');
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      'Memorial',
                                      style: TextStyle(
                                        color:
                                            controller.accountSelectedTab.value ==
                                                    'Memorial'
                                                ? AppColor.buttonColor
                                                : AppColor.textGreyColor3,
                                        fontSize: 16,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w400,
                                        height: 2,
                                        letterSpacing: 0.50,
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    SizedBox(
                                      height: 2.h,
                                      width: 130.w,
                                      child: Divider(
                                        height: 5.h,
                                        thickness: 2.h,
                                        color:
                                            controller.accountSelectedTab.value ==
                                                    'Memorial'
                                                ? AppColor.buttonColor
                                                : AppColor.textAreaColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Obx(
                              () => GestureDetector(
                                onTap: () {
                                  controller.setAccountSelectedTab('Post');
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      'Post',
                                      style: TextStyle(
                                        color:
                                            controller.accountSelectedTab.value ==
                                                    'Post'
                                                ? AppColor.buttonColor
                                                : AppColor.textGreyColor3,
                                        fontSize: 16,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w400,
                                        height: 2,
                                        letterSpacing: 0.50,
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    SizedBox(
                                      height: 2.h,
                                      width: 130.w,
                                      child: Divider(
                                        height: 5.h,
                                        thickness: 2.h,
                                        color:
                                            controller.accountSelectedTab.value ==
                                                    'Post'
                                                ? AppColor.buttonColor
                                                : AppColor.textAreaColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Obx(
                              () => GestureDetector(
                                onTap: () {
                                  controller.setAccountSelectedTab('Event');
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      'Event',
                                      style: TextStyle(
                                        color:
                                            controller.accountSelectedTab.value ==
                                                    'Event'
                                                ? AppColor.buttonColor
                                                : AppColor.textGreyColor3,
                                        fontSize: 16,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w400,
                                        height: 2,
                                        letterSpacing: 0.50,
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    SizedBox(
                                      height: 2.h,
                                      width: 130.w,
                                      child: Divider(
                                        height: 5.h,
                                        thickness: 2.h,
                                        color:
                                            controller.accountSelectedTab.value ==
                                                    'Event'
                                                ? AppColor.buttonColor
                                                : AppColor.textAreaColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Container(
                    width: double.infinity,
                    decoration: ShapeDecoration(
                      color: AppColor.backgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Obx(
                      () => IndexedStack(
                        index: [
                          'Memorial',
                          'Post',
                          'Event',
                        ].indexOf(controller.accountSelectedTab.value),
                        children: [
                          MemorialView(),
                          PostView(),
                          EventListView(arguments: arguments[0]),
                        ],
                      ),
                    ),
                  );
                }, childCount: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
