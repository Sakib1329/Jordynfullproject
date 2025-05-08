import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/explore/views/event_view.dart';
import 'package:jordyn/app/modules/home/views/scheduledetail.dart';
import '../../../../res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../controllers/home_controller.dart';
import '../widget/profilecardwidget.dart';

class Schedule extends StatelessWidget {
  final HomeController controller = Get.find();
  Schedule({super.key});

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
          'Schedule Post',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Text(
                'Vestibulum sodales pulvinar accumsan raseing rhoncus neque',
                style: TextStyle(color: AppColor.greyTone, fontSize: 20),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Get.to(Scheduledetail(), transition: Transition.rightToLeft);
                },
                child: ProfileCardWidget(
                  imagePath: ImageAssets.person2,
                  title: 'Person Name',
                  showSubtitle1: true,
                  subtitle2: 'June 1st, 2024 12PM',
                  subtitle2IconPath:
                      ImageAssets.calender2, // Add your icon path here
                ),
              ),
              ListView.builder(
                itemCount: 50,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(EventView(), transition: Transition.noTransition);
                    },
                    child: ProfileCardWidget(
                      imagePath: ImageAssets.flower,
                      title: 'Sophia Anderson',
                      showSubtitle1: true,
                      subtitle1: 'Category Name',
                      subtitle2: 'June 1st, 2024 12PM',
                      subtitle2IconPath:
                          ImageAssets.calender2, // Add your icon path here
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
