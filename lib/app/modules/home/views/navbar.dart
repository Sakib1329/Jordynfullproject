import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/chat/views/chat.dart';
import 'package:jordyn/app/modules/explore/views/explore.dart';
import 'package:jordyn/app/modules/home/views/home_view.dart';
import 'package:jordyn/app/modules/memory/views/memory.dart';
import 'package:jordyn/app/modules/profile/views/profile.dart';
import 'package:jordyn/app/modules/profile/views/settings.dart';
import 'package:jordyn/res/assets/image_assets.dart';
import 'package:jordyn/res/colors/app_color.dart';

import '../controllers/home_controller.dart';

class Navigation extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => [
        HomeView(),
        Explore(),
        Memory(),
        Chat(),
        Settings()
      ][controller.currentIndex.value]),

      bottomNavigationBar: Obx(() => Container(
        height: 110,
        decoration: BoxDecoration(
          color: AppColor.backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 15,
              offset: Offset(0, 10),
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
              child: Container(
                width: 65,
                height: 62,
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
                      width: 33,
                      height: 33,
                      color: isSelected
                          ? AppColor.darkGrey
                          : AppColor.greyBC,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      ['Home', 'Explore', 'Memory', 'Chat', 'Profile']
                      [index],
                      style: TextStyle(
                        fontSize: 14,
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
      )),
    );
  }


}

