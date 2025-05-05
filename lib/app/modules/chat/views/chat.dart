import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_controller.dart';



class Chat extends GetView<ChatController> {
  const Chat ({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OnboardingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Chat is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
