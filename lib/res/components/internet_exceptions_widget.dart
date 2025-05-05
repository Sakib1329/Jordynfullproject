import 'package:canvel/app/modules/auth/views/auth_view.dart';
import 'package:canvel/common/widgets/round_button.dart';
import 'package:canvel/res/assests/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../colors/app_color.dart';

class InternetExceptionsWidget extends StatefulWidget {
  // final VoidCallback onPress;
  // const InternetExceptionsWidget({super.key, required this.onPress});

  @override
  State<InternetExceptionsWidget> createState() =>
      _InternetExceptionsWidgetState();
}

class _InternetExceptionsWidgetState extends State<InternetExceptionsWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(ImageAssets.nointernet),
            SizedBox(height: 20,),
            Text(
              'No Internet connection!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF101B05),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: 20,),
            Text(
              'Please check your connection.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF101B05),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                letterSpacing: 0.60,
              ),
            ),
            SizedBox(height:30),
            RoundButton(
              height: 60,
              fontSize: 20,
              title: 'Try again', onPress: () async {try {
              // Navigation logic is commented out in the original code
              // controller.setCurrentStep(7);
              Get.off(
                    () => AuthView(),
                transition: Transition.noTransition,
              );
            } catch (e) {
              Get.snackbar(
                'Navigation Error',
                'Failed to navigate: $e',
                snackPosition: SnackPosition.BOTTOM,
              );
            }},
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
