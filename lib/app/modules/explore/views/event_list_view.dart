import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/explore/views/event_view.dart';
import 'package:jordyn/app/modules/home/widget/profilecardwidget.dart';
import 'package:jordyn/res/assets/image_assets.dart';

class EventListView extends GetView {
  final String?
  arguments; // Make it nullable to handle cases where no argument is passed

  const EventListView({super.key, this.arguments});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.09.sh),
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: ListView.builder(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: 50,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                final String? origin =
                    arguments ?? Get.arguments?['origin'] as String?;
                if (origin == 'ExporleView') {
                  Get.to(
                    () => EventView(),
                    transition: Transition.noTransition,
                    arguments: {'origin': 'ExporleView'},
                  );
                } else {
                  Get.to(
                    () => EventView(),
                    transition: Transition.noTransition,
                    arguments: {'origin': 'EventView'},
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ProfileCardWidget(
                  imagePath: ImageAssets.flower,
                  title: 'Sophia Anderson',
                  showSubtitle1: true,
                  subtitle1: 'Category Name',
                  subtitle2: 'June 1st, 2024 12PM',
                  subtitle2IconPath: ImageAssets.calender2,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
