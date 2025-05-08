import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:jordyn/app/modules/explore/views/event_view.dart';
import 'package:jordyn/app/modules/home/widget/profilecardwidget.dart';
import 'package:jordyn/res/assets/image_assets.dart';

class EventListView extends GetView {
  const EventListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.09.sh),
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: ListView.builder(
          itemCount: 50,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){Get.to(EventView(),transition: Transition.noTransition);},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ProfileCardWidget(
                  imagePath: ImageAssets.flower,
                  title: 'Sophia Anderson',
                  showSubtitle1: true,
                  subtitle1: 'Category Name',
                  subtitle2: 'June 1st, 2024 12PM',
                  subtitle2IconPath: ImageAssets.calender2, // Add your icon path here
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
