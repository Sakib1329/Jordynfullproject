import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jordyn/app/modules/profile/views/aboutapp.dart';
import 'package:jordyn/app/modules/profile/views/deleteaccount.dart';
import 'package:jordyn/app/modules/profile/views/passchange.dart';
import 'package:jordyn/app/modules/profile/views/privacy.dart';
import 'package:jordyn/app/modules/profile/views/termsofuse.dart';
import 'package:jordyn/res/assets/image_assets.dart';
import 'package:jordyn/res/colors/app_color.dart';

import '../../auth/views/link_social_view.dart';
import '../../auth/views/plan_view.dart';
import '../../auth/views/update_password_view.dart';
import 'blocklistpage.dart';
import 'familytree.dart';
import 'feedback.dart';
import 'notification.dart';

class Settings extends StatelessWidget {
   Settings({super.key});
  final List<Map<String, dynamic>> menuItems = [
    {'title': 'Block List', 'icon': ImageAssets.blocklist},
    {'title': 'Family Tree', 'icon': ImageAssets.familytree},
    {'title': 'Link your Social Media', 'icon': ImageAssets.socialmedia},
    {'title': 'Subscription', 'icon': ImageAssets.subscription},
    {'title': 'Notification Setting', 'icon': ImageAssets.notification1},
    {'title': 'Change Password', 'icon': ImageAssets.changepass},
    {'title': 'Feedback', 'icon': ImageAssets.feedback},
    {'title': 'About App', 'icon': ImageAssets.aboutapp},
    {'title': 'Privacy Policy', 'icon': ImageAssets.privacy},
    {'title': 'Terms of Use', 'icon': ImageAssets.termsofuse},
    {'title': 'Logout', 'icon': ImageAssets.logout},
    {'title': 'Delete Account', 'icon': ImageAssets.deleteaccount, 'isDelete': true},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, size: 20.sp),
        ),
        title: Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          final isDelete = item['isDelete'] == true;

          return ListTile(

            leading: Image.asset(
              item['icon'],
              width: 24.w,
              height: 24.w,
              color: isDelete ? AppColor.deepred: AppColor.greyTone,
            ),
            title: Text(
              item['title'],
              style: TextStyle(
                fontSize: 18.sp,
                color: isDelete ? AppColor.deepred: AppColor.greyTone,
                fontWeight: isDelete ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            onTap: () {
              switch (item['title']) {
                case 'Block List':
                  Get.to(Blocklistpage(), transition: Transition.rightToLeft);
                  break;
                case 'Family Tree':
                  Get.to(() => FamilyTreePage());
                  break;
                case 'Link your Social Media':
Get.to(LinkSocialView());
                  break;
                case 'Subscription':
Get.to(PlanView());
                  break;
                case 'Notification Setting':
                  Get.to(NotificationSettings(), transition: Transition.rightToLeft);
                  break;
                case 'Change Password':
                  Get.to(Passchange());
                  break;
                case 'Feedback':
                  Get.to(FeedBack(), transition: Transition.rightToLeft);
                  break;
                case 'About App':
                  Get.to(Aboutapp(), transition: Transition.rightToLeft);
                  break;
                case 'Privacy Policy':
                  Get.to(Privacy(), transition: Transition.rightToLeft);
                  break;
                case 'Terms of Use':
                  Get.to(Termsofuse(), transition: Transition.rightToLeft);
                  break;
                case 'Logout':
                // Handle logout logic here, e.g., show confirmation dialog
                  break;
                case 'Delete Account':
                  Get.to(Deleteaccount(), transition: Transition.rightToLeft);
                  break;
              }
            },

          );
        },
      )
    );
  }
}
