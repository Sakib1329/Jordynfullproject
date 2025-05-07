import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:jordyn/res/colors/app_color.dart';

class QRScannerWidget extends StatelessWidget {
  final Function(String) onDetect;

  const QRScannerWidget({super.key, required this.onDetect});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          MobileScanner(
            controller: MobileScannerController(
              detectionSpeed: DetectionSpeed.normal,
              facing: CameraFacing.back,
            ),
            onDetect: (capture) {
              final barcode = capture.barcodes.first;
              final String? code = barcode.rawValue;
              if (code != null) {
                onDetect(code);
              }
            },
          ),
          // Dark overlay with transparent scan area
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          Center(
            child: Container(
              width: 250.w,
              height: 250.w,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.greenAccent,
                  width: 3.w,
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
          // Back button
          Positioned(
            top: 50.h,
            left: 20.w,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.arrow_back, color: Colors.white, size: 24.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
