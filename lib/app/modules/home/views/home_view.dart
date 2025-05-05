import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../../res/assets/image_assets.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
  Image.asset(ImageAssets.scanner,width: 32,),
  SizedBox(width: 15,),
  Image.asset(ImageAssets.schedule,width: 32,),
    SizedBox(width: 15,),
    Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: Color(0xFFEAE0D0), // background beige color
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Center(
            child: Icon(
              Icons.notifications_none_sharp,
              size: 30,
              color: Colors.black87,
            ),
          ),
          // Badge
          Positioned(
            top: 0,
            right: 1,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
              child: Center(
                child: Text(
                  '2', // Replace with your dynamic number
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),

    SizedBox(width: 10,),

],)
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text('Hi, Audrey'),
            Text('Welcome back to Inspirit!',style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w500),)
          ],
        ),


      ),
      body: const Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
