import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jordyn/res/colors/app_color.dart';
import '../controllers/profile_controller.dart';
 // make sure to import your controller

class CustomSwitchTile extends StatelessWidget {
  final String title;
  final ProfileController controller;

   CustomSwitchTile({
    super.key,
    required this.title,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFFAF3E9),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          Obx(() => CupertinoSwitch(
            value: controller.isSwitched.value,
            onChanged: controller.toggleSwitch,
            activeTrackColor: AppColor.beigeBrown,
          )),
        ],
      ),
    );
  }
}
