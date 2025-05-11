import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/explore/views/event_list_view.dart';
import 'package:jordyn/app/modules/explore/views/user_list_view.dart';
import 'package:jordyn/app/modules/memory/views/memorial_view.dart';
import 'package:jordyn/widgets/input_text_widget.dart';
import '../../../../res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../controller/explore_controller.dart';

class Explore extends StatelessWidget {
  final String? arguments;
  final ExploreController controller = Get.find();
  Explore({super.key, this.arguments});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ExploreController());
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
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
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: InputTextWidget(
                          onChanged: (e) {},
                          borderColor: AppColor.backgroundColor,
                          hintText: 'Search',
                          hintTextColor: AppColor.textGreyColor2,
                          leadingIcon: ImageAssets.search,
                          textColor: AppColor.textGreyColor2,
                          leading: true,
                          height: 48.h,
                          width: 360.w,
                        ),
                      ),
                    ],
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: Obx(
                              () => GestureDetector(
                                onTap: () {
                                  controller.setSelectedTab('User');
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      'User',
                                      style: TextStyle(
                                        color:
                                            controller.selectedTab.value == 'User'
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
                                            controller.selectedTab.value == 'User'
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
                                  controller.setSelectedTab('Memory');
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      'Memory',
                                      style: TextStyle(
                                        color:
                                            controller.selectedTab.value ==
                                                    'Memory'
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
                                            controller.selectedTab.value ==
                                                    'Memory'
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
                                  controller.setSelectedTab('Event');
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      'Event',
                                      style: TextStyle(
                                        color:
                                            controller.selectedTab.value ==
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
                                            controller.selectedTab.value ==
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
                              'User',
                              'Memory',
                              'Event',
                            ].indexOf(controller.selectedTab.value),
                            children: [
                              UserListView(arguments: arguments),
                              MemorialView(),
                              EventListView(arguments: arguments),
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
      },
    );
  }
}
