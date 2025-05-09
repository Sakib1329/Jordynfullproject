import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/explore/views/account_view.dart';
import 'package:jordyn/app/modules/profile/controllers/profile_controller.dart';

class Profile extends StatelessWidget {
  final String? arguments;
  final ProfileController controller = Get.find();
  Profile({super.key, this.arguments});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProfileController());
    return AccountView(arguments: arguments);
  }
}
