import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MemorialView extends GetView {
  const MemorialView({super.key});
  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Text(
          'MemorialView is working',
          style: TextStyle(fontSize: 20),
        ),
      );
  }
}
