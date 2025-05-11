import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/explore/views/event_list_view.dart';
import 'package:jordyn/app/modules/memory/views/memorial_view.dart';
import 'package:jordyn/app/modules/explore/views/post_view.dart';
import '../../../../res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../controller/explore_controller.dart';

class AccountDragView extends StatelessWidget {
  final List<String?> arguments;
  final ExploreController controller = Get.find();
  AccountDragView({super.key, required this.arguments});
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
                expandedHeight: 70.h, // Adjust height for profile section
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 2.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30.r,
                          backgroundColor: Colors.grey[300],
                          child: ClipOval(
                            child: Image.asset(
                              ImageAssets.image,
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Sophia Johnson',
                                style: TextStyle(
                                  color: AppColor.darkGrey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp,
                                  fontFamily: 'Montserrat'
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Row(
                                children: [
                                  Text(
                                    '@abc_xyz',
                                    style: TextStyle(
                                      color: AppColor.subTitleGrey,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Montaga'
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: InkWell(
                            onTap: () {
                              // Get.to(page); // Add navigation logic if needed
                            },
                            child: Image.asset(ImageAssets.settings),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                actions: [

                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
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
