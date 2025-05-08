import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/memory/controllers/memory_controller.dart';
import 'package:jordyn/app/modules/memory/views/memory_history_view.dart';
import 'package:jordyn/res/assets/image_assets.dart';
import 'package:jordyn/res/colors/app_color.dart';
import 'package:jordyn/widgets/custom_button.dart';

class MemoryDetailsView extends GetView<MemoryController> {
  const MemoryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Scaffold(
          body: Stack(
            children: [
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(
                  ImageAssets.memoryBackground,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 80.h,
                left: 15.w,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(
                    ImageAssets.back_arrow,
                    height: 28,
                    width: 28,
                  ),
                ),
              ),
              Positioned(
                top: 75.h,
                right: 20.w,
                child: Image.asset(ImageAssets.menu),
              ),
              Positioned(
                top: 200.h,
                left: 20.w,
                child: Column(
                  children: [
                    Image.asset(ImageAssets.image1),
                    SizedBox(height: 10.h),
                    Text(
                      'Sophia Johnson',
                      style: TextStyle(
                        color: AppColor.buttonColor,
                        fontSize: 22.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      '1992 - 1024',
                      style: TextStyle(
                        color: AppColor.subTitleGrey,
                        fontSize: 16.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Morbi vitae libero libero. Quisque\nviverra semper eros in ultrices. Cras vel augue\ntristique, gravida nulla a, blandit ex.',
                      style: TextStyle(
                        color: AppColor.greyTone,
                        fontSize: 16.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Lorem ipsum dolor sit amet',
                      style: TextStyle(
                        color: AppColor.textSendColor,
                        fontSize: 16.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(children: [

                      Image.asset(ImageAssets.candle,width: 185.w,height: 200.h,),
                      Image.asset(ImageAssets.flower1,width: 185.w,height: 200.h,),
                    ],),
                    SizedBox(height: 50.h),
                    CustomButton(
                      onPress: () async {
                        Get.to(MemoryHistoryView(), transition: Transition.noTransition);
                      },
                      title: 'View Obituary',fontSize: 16.w,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      textColor: AppColor.buttonColor,
                      borderColor: AppColor.buttonColor,
                      buttonColor: Colors.transparent,
                      height: 48.h,
                      width: 390.w,
                      radius: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
