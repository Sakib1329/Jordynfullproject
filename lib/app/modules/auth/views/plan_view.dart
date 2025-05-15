import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/auth/controllers/auth_controller.dart';
import 'package:jordyn/app/modules/auth/views/successfully_view.dart';
import 'package:jordyn/res/assets/image_assets.dart';
import 'package:jordyn/res/colors/app_color.dart';
import 'package:jordyn/widgets/custom_button.dart';

class PlanView extends GetView<AuthController> {
  const PlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset(ImageAssets.back_arrow),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 40),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Select your Plan',
                              style: TextStyle(
                                color: AppColor.buttonColor,
                                fontSize: 24,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Vestibulum sodales pulvinar accumsan raseing rhoncus neque',
                              style: TextStyle(
                                color: AppColor.textGreyColor2,
                                fontSize: 16,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              controller.selectPlan('Basic');
                            },
                            child: Container(
                              width: 390,
                              decoration: ShapeDecoration(
                                color:
                                    controller.selectedPlan.value == 'Basic'
                                        ? AppColor.buttonColor
                                        : AppColor.textAreaColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                              padding: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Basic Plan',
                                        style: TextStyle(
                                          color:
                                              controller.selectedPlan.value ==
                                                      'Basic'
                                                  ? AppColor.whiteTextColor
                                                  : AppColor.textGreyColor2,
                                          fontSize: 18,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        '\$10/m',
                                        style: TextStyle(
                                          color:
                                              controller.selectedPlan.value ==
                                                      'Basic'
                                                  ? AppColor.whiteTextColor
                                                  : AppColor.buttonColor,
                                          fontSize: 18,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Allows users to upload 10 photos, 5 videos, and access standard tribute features.',
                                    style: TextStyle(
                                      color:
                                          controller.selectedPlan.value ==
                                                  'Basic'
                                              ? AppColor.whiteTextColor
                                              : AppColor.textGreyColor2,
                                      fontSize: 15,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              controller.selectPlan('Premium');
                            },
                            child: Container(

                              width: 390,
                              decoration: ShapeDecoration(
                                color:
                                    controller.selectedPlan.value == 'Premium'
                                        ? AppColor.buttonColor
                                        : AppColor.textAreaColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                              padding: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Premium Plan',
                                        style: TextStyle(
                                          color:
                                              controller.selectedPlan.value ==
                                                      'Premium'
                                                  ? AppColor.whiteTextColor
                                                  : AppColor.textGreyColor2,
                                          fontSize: 18,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        '\$25/m',
                                        style: TextStyle(
                                          color:
                                              controller.selectedPlan.value ==
                                                      'Premium'
                                                  ? AppColor.whiteTextColor
                                                  : AppColor.buttonColor,
                                          fontSize: 18,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Allows users to upload 50 photos, 20 videos, and priority tributes.',
                                    style: TextStyle(
                                      color:
                                          controller.selectedPlan.value ==
                                                  'Premium'
                                              ? AppColor.whiteTextColor
                                              : AppColor.textGreyColor2,
                                      fontSize: 15,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              controller.selectPlan('Gold');
                            },
                            child: Container(

                              width: 390,
                              decoration: ShapeDecoration(
                                color:
                                    controller.selectedPlan.value == 'Gold'
                                        ? AppColor.buttonColor
                                        : AppColor.textAreaColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                              padding: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Gold Plan',
                                        style: TextStyle(
                                          color:
                                              controller.selectedPlan.value ==
                                                      'Gold'
                                                  ? AppColor.whiteTextColor
                                                  : AppColor.textGreyColor2,
                                          fontSize: 18,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        '\$50/m',
                                        style: TextStyle(
                                          color:
                                              controller.selectedPlan.value ==
                                                      'Gold'
                                                  ? AppColor.whiteTextColor
                                                  : AppColor.buttonColor,
                                          fontSize: 18,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Provides unlimited photo and video uploads along with exclusive features.',
                                    style: TextStyle(
                                      color:
                                          controller.selectedPlan.value ==
                                                  'Gold'
                                              ? AppColor.whiteTextColor
                                              : AppColor.textGreyColor2,
                                      fontSize: 15,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
                CustomButton(
                  onPress: () async {
                    if (controller.selectedPlan.value != null) {
                      Get.to(
                        SuccessfullyView(),
                        transition: Transition.noTransition,
                      );
                    } else {
                      Get.snackbar(
                        'Error',
                        'Please select a plan',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                  },
                  title: 'NEXT',
                  height: 48,
                  width: 390,
                  radius: 100.r,
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
