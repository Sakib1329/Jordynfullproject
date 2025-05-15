import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/memory/controllers/memory_controller.dart';
import 'package:jordyn/app/modules/memory/views/add_memory_view.dart';
import 'package:jordyn/app/modules/memory/views/condolences_history_list_view.dart';
import 'package:jordyn/app/modules/memory/views/create_condolences_view.dart';
import 'package:jordyn/app/modules/memory/views/memory_details_view.dart';
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
      designSize: const Size(360, 690),
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
                        automaticallyImplyLeading: false,
                        expandedHeight: 30.h, // or adjust as needed
                        flexibleSpace: SafeArea(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(MemoryDetailsView(), transition: Transition.leftToRight);
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    size: 22,
                                    color: AppColor.greyTone,
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),

                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(

                            children: [
                              Expanded(
                                child: Obx(
                                  () => GestureDetector(
                                    onTap: () {
                                      controller.setHistorySelectedTab(
                                        'Memorial',
                                      );
                                    },
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Center(
                                          child: Text(
                                            'Memorial',
                                            style: TextStyle(
                                              color:
                                                  controller
                                                              .hisrtorySelectedTab
                                                              .value ==
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
                                        ),
                                        SizedBox(height: 10),
                                        Container(
                                          height: 2,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            color:
                                            controller
                                                .hisrtorySelectedTab
                                                .value ==
                                                'Memorial'
                                                ? AppColor.buttonColor
                                                : AppColor.textAreaColor,
                                            borderRadius: BorderRadius.circular(1),
                                          ),

                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Obx(
                                  () => GestureDetector(
                                    onTap: () {
                                      controller.setHistorySelectedTab(
                                        'Condolences',
                                      );
                                    },
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Center(
                                          child: Text(
                                            'Condolences',
                                            style: TextStyle(
                                              color:
                                                  controller
                                                              .hisrtorySelectedTab
                                                              .value ==
                                                          'Condolences'
                                                      ? AppColor.buttonColor
                                                      : AppColor.textGreyColor3,
                                              fontSize: 16,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w400,
                                              height: 2,
                                              letterSpacing: 0.50,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Container(
                                          height: 2,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            color:
                                            controller
                                                .hisrtorySelectedTab
                                                .value ==
                                                'Condolences'
                                                ? AppColor.buttonColor
                                                : AppColor.textAreaColor,
                                            borderRadius: BorderRadius.circular(1),
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
                        }, childCount: 1),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 20),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: CustomButton(
                              onPress: () async {Get.to(CreateCondolencesView(),transition: Transition.noTransition);},
                              title: 'Condolences',
                              height: 48,

                              radius: 10.r,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              buttonColor: AppColor.backgroundColor,
                              textColor: AppColor.buttonColor,
                              borderColor: AppColor.buttonColor,
                            ),
                          ),
                          SizedBox(width: 20,),
                          Expanded(
                            child: CustomButton(
                              onPress: () async {Get.to(AddMemoryView(),transition: Transition.noTransition);},
                              title: 'Add Memory',
                              height: 48,

                              radius: 10.r,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
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
