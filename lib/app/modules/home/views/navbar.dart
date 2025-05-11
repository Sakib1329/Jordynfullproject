import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/chat/views/chat.dart';
import 'package:jordyn/app/modules/explore/views/explore.dart';
import 'package:jordyn/app/modules/home/views/home_view.dart';
import 'package:jordyn/app/modules/memory/views/memory.dart';
import 'package:jordyn/app/modules/profile/views/profile.dart';
import 'package:jordyn/res/assets/image_assets.dart';
import 'package:jordyn/res/colors/app_color.dart';
import '../controllers/home_controller.dart';

class Navigation extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
            () => [
          HomeView(arguments: 'ExporleView'),
          Explore(arguments: 'ExporleView'),
          Memory(arguments: 'EventView'),
          Chat(),
          Profile(arguments: 'EventView'),
        ][controller.currentIndex.value],
      ),
      bottomNavigationBar: Obx(
            () => Container(
          height: 110.h,
          decoration: BoxDecoration(
            color: AppColor.backgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 15.r,
                offset: Offset(0, 10.h),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(5, (index) {
              final isSelected = controller.currentIndex.value == index;
              return GestureDetector(
                onTap: () {
                  controller.currentIndex.value = index;
                  controller.isFabMenuOpen.value = false;
                },
                child: SizedBox(
                  width: 65.w,
                  height: 62.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        [
                          ImageAssets.home,
                          ImageAssets.explore,
                          ImageAssets.memory,
                          ImageAssets.chat,
                          ImageAssets.chat,
                        ][index],
                        width: 33.w,
                        height: 33.h,
                        color: isSelected
                            ? AppColor.darkGrey
                            : AppColor.greyBC,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        ['Home', 'Explore', 'Memory', 'Chat', 'Profile'][index],
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: isSelected
                              ? AppColor.darkGrey
                              : AppColor.greyBC,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
