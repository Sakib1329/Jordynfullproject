import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jordyn/app/modules/explore/controller/explore_controller.dart';
import 'package:jordyn/app/modules/profile/controllers/profile_controller.dart';

import '../../onboarding/controllers/onboarding_controller.dart';



class Profile extends StatelessWidget {
  const Profile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Profile is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
