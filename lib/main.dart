import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jordyn/res/colors/app_color.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.backgroundColor,
      ),
    ),
  );
}
