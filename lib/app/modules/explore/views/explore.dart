import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/explore/views/event_list_view.dart';
import 'package:jordyn/app/modules/explore/views/user_list_view.dart';
import 'package:jordyn/app/modules/home/controllers/home_controller.dart';
import 'package:jordyn/app/modules/memory/views/memorial_view.dart';
import 'package:jordyn/widgets/input_text_widget.dart';
import '../../../../res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../controller/explore_controller.dart';

class Explore extends StatelessWidget {
  final String? arguments;
  final ExploreController controller = Get.put(ExploreController());
  final HomeController homeController = Get.find();// Put outside build

  Explore({super.key, this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                snap: true,
                automaticallyImplyLeading: false,
                backgroundColor: AppColor.backgroundColor,
                expandedHeight: 70.h,
                flexibleSpace: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            if (controller.selectedTab.value == 'Memory') {
                              controller.selectedTab.value = 'User';
                            } else if (controller.selectedTab.value == 'Event') {
                              controller.selectedTab.value = 'Memory';
                            } else if (controller.selectedTab.value == 'User') {
                              homeController.currentIndex.value = 0;
                            }
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: AppColor.greyTone,
                            size: 25,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: InputTextWidget(
                            onChanged: (e) {},
                            borderColor: AppColor.backgroundColor,
                            hintText: 'Search',
                            hintTextColor: AppColor.textGreyColor2,
                            leadingIcon: ImageAssets.search,
                            textColor: AppColor.textGreyColor2,
                            leading: true,
                            height: 48,
                            width: double.infinity,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),


              // Tab Selector
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: ['User', 'Memory', 'Event'].map((tab) {
                      return Flexible(
                        child: Obx(() {
                          final isSelected = controller.selectedTab.value == tab;
                          return GestureDetector(
                            onTap: () => controller.setSelectedTab(tab),
                            child: Column(
                              children: [
                                Text(
                                  tab,
                                  style: TextStyle(
                                    color: isSelected ? AppColor.buttonColor : AppColor.textGreyColor3,
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
                                    color: isSelected ? AppColor.buttonColor : AppColor.textAreaColor,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      );
                    }).toList(),
                  ),
                ),
              ),

              // View Content (One-time loaded)
              SliverToBoxAdapter(
                child: Obx(() => IndexedStack(
                  index: ['User', 'Memory', 'Event'].indexOf(controller.selectedTab.value),
                  children: [
                    UserListView(arguments: arguments),
                    MemorialView(),
                    EventListView(arguments: arguments),
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
