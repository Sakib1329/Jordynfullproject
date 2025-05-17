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
import '../../auth/controllers/authcameracontroller.dart';
import '../../chat/controllers/bottomsheetcontroller.dart';
import '../controllers/home_controller.dart';

class Navigation extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  final BottomSheetController bs = Get.put(BottomSheetController());
  final AuthBottomSheetController as = Get.put(AuthBottomSheetController());
  Navigation({super.key});

  final List<String> labels = ['Home', 'Explore', 'Memory', 'Chat', 'Profile'];
  final List<String> icons = [
    ImageAssets.home,
    ImageAssets.explore,
    ImageAssets.memory,
    ImageAssets.chat,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => [
        HomeView(arguments: 'ExporleView'),
        Explore(arguments: 'ExporleView'),
        Memory(arguments: 'EventView'),
        Chat(),
        Profile(arguments: 'EventView'),
      ][controller.currentIndex.value]),
      bottomNavigationBar: Obx(
            () => Container(

          decoration: BoxDecoration(
            color: AppColor.backgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 15.r,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 15.0),
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
                    width: 65,
                    height: 62,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (index == 4)
                          Obx(() {
                            final file = as.pickedImage.value;
                            return CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.transparent,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: file != null
                                    ? Image.file(
                                  file,
                                  width: 33,
                                  height: 33,
                                  fit: BoxFit.cover,
                                )
                                    : Image.asset(
                                  ImageAssets.avater,
                                  width: 33,
                                  height: 33,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          })
                        else
                          Image.asset(
                            icons[index],
                            width: 33,

                            color: isSelected
                                ? AppColor.darkGrey
                                : AppColor.greyBC,
                          ),
                        SizedBox(height: 4),
                        Text(
                          labels[index],
                          style: TextStyle(
                            fontSize: 14,
                            color:
                            isSelected ? AppColor.darkGrey : AppColor.greyBC,
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
      ),
    );
  }
}
