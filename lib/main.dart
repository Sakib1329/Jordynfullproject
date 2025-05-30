import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/auth/controllers/auth_controller.dart';
import 'package:jordyn/res/colors/app_color.dart';
import 'app/modules/explore/controller/explore_controller.dart';
import 'app/modules/memory/controllers/memory_controller.dart';
import 'app/modules/profile/controllers/profile_controller.dart';
import 'app/routes/app_pages.dart';

void main() {
  Get.put(AuthController());
  Get.put(ProfileController());
  Get.put(ExploreController());
  Get.put(MemoryController());

  runApp(
    ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Application",
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            theme: ThemeData(
              scaffoldBackgroundColor: AppColor.backgroundColor,
              appBarTheme: AppBarTheme(
                elevation: 0,
                backgroundColor: AppColor.backgroundColor,
                scrolledUnderElevation: 0,
              ),
            ),
          ),
        );
      },
    ),
  );
}
