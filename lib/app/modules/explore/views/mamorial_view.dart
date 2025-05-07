import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MamorialView extends GetView {
  const MamorialView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MamorialView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MamorialView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
