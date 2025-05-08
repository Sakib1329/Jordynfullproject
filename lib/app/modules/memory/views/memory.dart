
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/explore/views/event_list_view.dart';
import 'package:jordyn/app/modules/home/views/createpost.dart';
import 'package:jordyn/app/modules/memory/controllers/memory_controller.dart';
import 'package:jordyn/app/modules/memory/views/memorial_view.dart';
import '../../../../res/colors/app_color.dart';

class Memory extends StatelessWidget {
  final MemoryController controller = Get.find();
  Memory({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MemoryController());
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
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Obx(() => GestureDetector(
                                  onTap: () {
                                    controller.setSelectedTab('Memorial');
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        'Memorial',
                                        style: TextStyle(
                                          color:
                                          controller.selectedTab.value == 'Memorial'
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
                                          controller.selectedTab.value == 'Memorial'
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
                                          controller.selectedTab.value == 'Event'
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
                                          controller.selectedTab.value == 'Event'
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
                                  EventListView(),
                                ],
                              ),
                            ),
                          );
                        }, childCount: 20),
                      ),
                    ],
                  ),
                  Obx(() => controller.isFabMenuOpen.value
                      ? GestureDetector(
                    onTap: () => controller.isFabMenuOpen.value = false,
                    child: Container(color: Colors.black54),
                  )
                      : SizedBox()),
                  Obx(() => controller.isFabMenuOpen.value
                      ? Positioned(
                    bottom: 80.h,
                    right: 70.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _fabOption(label: 'Create Event',ontap: (){}),
                        SizedBox(height: 12.h),
                        _fabOption(label: 'Create Post',ontap: (){Get.to(Createpost(),transition: Transition.rightToLeft);}),
                        SizedBox(height: 12.h),
                        _fabOption(label: 'Create Memory',ontap: (){}),
                      ],
                    ),
                  )
                      : SizedBox()),
                ],
              ),
            ),
          ),
          floatingActionButton: Obx(() => Padding(
            padding: EdgeInsets.only(right: 8.w, bottom: 8.h),
            child: Transform.rotate(
              angle: controller.isFabMenuOpen.value
                  ? 45 * 3.1416 / 180
                  : 90 * 3.1416 / 180,
              child: FloatingActionButton(
                onPressed: () => controller.isFabMenuOpen.toggle(),
                backgroundColor: AppColor.beigeBrown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Icon(
                  Icons.add,
                  size: 40.sp,
                  color: AppColor.whiteTextColor,
                ),
              ),
            ),
          )),
        );
      },
    );
  }

  Widget _fabOption({required String label,required VoidCallback? ontap}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 200.w,
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: AppColor.backgroundColor,
          borderRadius: BorderRadius.circular(30.r),
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 6.r),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: AppColor.textGreyColor,
              letterSpacing: 1,
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
    );
  }
}
