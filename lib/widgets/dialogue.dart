
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jordyn/res/colors/app_color.dart';

class CenteredDialogWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageasset;
  final Color backgroundColor;
  final Color iconBackgroundColor;
  final Color iconColor;
  final double borderRadius;
  final VoidCallback? onClose;
  final double horizontalpadding;
  final double verticalpadding;

  const CenteredDialogWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageasset,
    this.horizontalpadding=1,
    this.verticalpadding=16.0,
    this.backgroundColor = const Color(0xFFF8F3E8), // Light beige background
    this.iconBackgroundColor = const Color(0xFFA9BE8B), // Sage green circle
    this.iconColor = Colors.white,
    this.borderRadius = 32.0,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalpadding, vertical: verticalpadding),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // SVG Icon with circular background
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  imageasset,
                ),
              ),
            ),
             SizedBox(height: 24.h),

            // Title text
            Text(
              title,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: AppColor.buttonColor,
              ),
              textAlign: TextAlign.center,
            ),
             SizedBox(height: 16.h),

            // Subtitle text
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}