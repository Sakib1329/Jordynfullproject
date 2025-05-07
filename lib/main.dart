import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:jordyn/app/modules/auth/controllers/auth_controller.dart';
import 'package:jordyn/res/colors/app_color.dart';

import 'app/modules/explore/controller/explore_controller.dart';
import 'app/modules/profile/controllers/profile_controller.dart';
import 'app/routes/app_pages.dart';

void main() {
  Get.put(AuthController());
  Get.put(ProfileController());
  Get.put(ExploreController());
  runApp(
    ScreenUtilInit(
      designSize: Size(360, 690),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,


      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.backgroundColor,
        appBarTheme: AppBarTheme(
         // color: AppColor.backgroundColor,
      elevation: 0,
      backgroundColor:AppColor.backgroundColor,
        scrolledUnderElevation: 0
        )
      ),



      ),
    ),
  );
}
