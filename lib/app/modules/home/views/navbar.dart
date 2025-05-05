

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/chat/views/chat.dart';
import 'package:jordyn/app/modules/explore/views/explore.dart';
import 'package:jordyn/app/modules/home/views/home_view.dart';
import 'package:jordyn/app/modules/memory/views/memory.dart';
import 'package:jordyn/app/modules/profile/views/profile.dart';
import 'package:jordyn/res/assets/image_assets.dart';


import '../controllers/home_controller.dart';



class Navigation extends StatelessWidget {

  final HomeController controller = Get.put(HomeController());

  Navigation({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Obx(() {
        return [
       HomeView(),
          Explore(),
          Memory(),
          Chat(),
          Profile(),

        ][controller.currentIndex.value];
      }),
      bottomNavigationBar: Obx(() => Container(
        margin: EdgeInsets.only( bottom: 40,left: 20,right: 20), // Margin at the bottom for the floating effect
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 15,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(6, (index) {
            final isSelected = controller.currentIndex.value == index;
            return GestureDetector(
              onTap: () => controller.currentIndex.value = index,
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
                        ImageAssets.chat
                      ][index],

                      width: 33,
                      height: 33,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      [
                        'Home',
                        'Explore',
                        'Memory',
                        'Chat',
                        'Profile'
                      ][index],
                      style: TextStyle(
                        fontSize: 14,
                        color: isSelected ? Colors.black : Colors.grey,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
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
