import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
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
