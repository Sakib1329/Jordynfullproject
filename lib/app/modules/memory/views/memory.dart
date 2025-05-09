import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/explore/views/event_list_view.dart';
import 'package:jordyn/app/modules/memory/controllers/memory_controller.dart';
import 'package:jordyn/app/modules/memory/views/add_person_view.dart';
import 'package:jordyn/app/modules/memory/views/create_event_view.dart';
import 'package:jordyn/app/modules/memory/views/memorial_view.dart';
import '../../../../res/colors/app_color.dart';

class Memory extends StatelessWidget {
  final String? arguments;
  final MemoryController controller = Get.find();
  Memory({super.key, this.arguments});
  @override
  Widget build(BuildContext context) {
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
              child: Stack(
                children: [
                  CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        floating: true,
                        snap: true,
                        backgroundColor: AppColor.backgroundColor,
                        title: Text('My Memory'),
                        centerTitle: true,
                        automaticallyImplyLeading: false,
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    controller.setSelectedTab('Memorial');
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        'Memorial',
                                        style: TextStyle(
                                          color:
                                              controller.selectedTab.value ==
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
                                        width: 215.w,
                                        child: Divider(
                                          height: 5.h,
                                          thickness: 2.h,
                                          color:
                                              controller.selectedTab.value ==
                                                      'Memorial'
                                                  ? AppColor.buttonColor
                                                  : AppColor.textAreaColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Obx(
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
                                        width: 215.w,
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
                                  'Event',
                                ].indexOf(controller.selectedTab.value),
                                children: [
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
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed:
                () => {
                  if (controller.selectedTab.value == 'Memorial')
                    {
                      Get.to(
                        AddPersonView(),
                        transition: Transition.noTransition,
                      ),
                    },
                  if (controller.selectedTab.value == 'Event')
                    {
                      Get.to(
                        CreateEventView(),
                        transition: Transition.noTransition,
                      ),
                    },
                },
            backgroundColor: AppColor.beigeBrown,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Icon(Icons.add, size: 40.sp, color: AppColor.whiteTextColor),
          ),
        );
      },
    );
  }
}
