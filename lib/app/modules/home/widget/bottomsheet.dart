import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jordyn/res/colors/app_color.dart';

class ReportOption {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  ReportOption({
    required this.icon,
    required this.label,
    required this.onTap,
  });
}

class ReportBottomSheet extends StatelessWidget {
  final bool showTwoOptions;
  final ReportOption firstOption;
  final ReportOption? secondOption;

  const ReportBottomSheet({
    super.key,
    required this.showTwoOptions,
    required this.firstOption,
    this.secondOption,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (_, __) => Container(
        height: 0.21.sh,
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: AppColor.backgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
        ),
        child: Column(
          children: [
            // Drag indicator
            Container(
              width: 80,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildOption(firstOption),
                if (showTwoOptions && secondOption != null) SizedBox(width: 40),
                if (showTwoOptions && secondOption != null) _buildOption(secondOption!),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(ReportOption option) {
    return GestureDetector(
      onTap: option.onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.r),
            decoration: const BoxDecoration(
              color: Color(0xFFE8DBC4),
              shape: BoxShape.circle,
            ),
            child: Icon(
              option.icon,
              size: 30,
              color: AppColor.greyTone,
            ),
          ),
          SizedBox(height: 10),
          Text(
            option.label,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
