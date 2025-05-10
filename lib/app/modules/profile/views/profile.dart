import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/explore/views/account_drag_view.dart';
import 'package:jordyn/app/modules/explore/views/account_view.dart';
import 'package:jordyn/app/modules/profile/controllers/profile_controller.dart';

class Profile extends StatelessWidget {
  final String? arguments;
  final ProfileController controller = Get.find();

  Profile({super.key, this.arguments});

  final String myprofile = 'myprofile';

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = ['account', 'account_drag'];

  return Obx(
          () => PageView.builder(
        controller: PageController(
          initialPage: tabs.indexOf(controller.SelectedTab.value),
        ),
        onPageChanged: (int page) {
          controller.setSelectedTab(tabs[page]);
        },
        itemCount: tabs.length,
        physics: const ClampingScrollPhysics(),
        pageSnapping: true,
        reverse: false, // Right-to-left sliding effect
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return AccountView(arguments: [arguments,myprofile]);
            case 1:
              return AccountDragView(arguments: [arguments,myprofile]);
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}