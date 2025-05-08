import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/memory/controllers/memory_controller.dart';
import 'package:jordyn/app/modules/memory/views/add_memory_view.dart';
import 'package:jordyn/app/modules/memory/views/condolences_history_list_view.dart';
import 'package:jordyn/app/modules/memory/views/create_condolences_view.dart';
import 'package:jordyn/app/modules/memory/views/memory_history_list_view.dart';
import 'package:jordyn/res/assets/image_assets.dart';
import 'package:jordyn/widgets/custom_button.dart';
import '../../../../res/colors/app_color.dart';

class MemoryHistoryView extends StatelessWidget {
  final MemoryController controller = Get.find();
  MemoryHistoryView({super.key});
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
                        centerTitle: true,
                        automaticallyImplyLeading: false,
                        actions: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Image.asset(
                                  ImageAssets.back_arrow,
                                  height: 28.h,
                                  width: 28.w,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 330.w),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Image.asset(ImageAssets.menu),
                          ),
                        ],
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
                                    controller.setHistorySelectedTab(
                                      'Memorial',
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        'Memorial',
                                        style: TextStyle(
                                          color:
                                              controller
                                                          .hisrtorySelectedTab
                                                          .value ==
                                                      'Memorial'
                                                  ? AppColor.buttonColor
                                                  : AppColor.textGreyColor3,
                                          fontSize: 16.sp,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w400,
                                          height: 2.h,
                                          letterSpacing: 0.50.w,
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
                                              controller
                                                          .hisrtorySelectedTab
                                                          .value ==
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
                                    controller.setHistorySelectedTab(
                                      'Condolences',
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        'Condolences',
                                        style: TextStyle(
                                          color:
                                              controller
                                                          .hisrtorySelectedTab
                                                          .value ==
                                                      'Condolences'
                                                  ? AppColor.buttonColor
                                                  : AppColor.textGreyColor3,
                                          fontSize: 16.sp,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w400,
                                          height: 2.h,
                                          letterSpacing: 0.50.w,
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
                                              controller
                                                          .hisrtorySelectedTab
                                                          .value ==
                                                      'Condolences'
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
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                            ),
                            child: Obx(
                              () => IndexedStack(
                                index: [
                                  'Memorial',
                                  'Condolences',
                                ].indexOf(controller.hisrtorySelectedTab.value),
                                children: [
                                  MemoryHistoryListView(),
                                  CondolencesHistoryListView(),
                                ],
                              ),
                            ),
                          );
                        }, childCount: 20),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomButton(
                          onPress: () async {Get.to(CreateCondolencesView(),transition: Transition.noTransition);},
                          title: 'Condolences',
                          height: 48.h,
                          width: 185.w,
                          radius: 10.r,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          buttonColor: AppColor.backgroundColor,
                          textColor: AppColor.buttonColor,
                          borderColor: AppColor.buttonColor,
                        ),
                        CustomButton(
                          onPress: () async {Get.to(AddMemoryView(),transition: Transition.noTransition);},
                          title: 'Add Memory',
                          height: 48.h,
                          width: 185.w,
                          radius: 10.r,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
