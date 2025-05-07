import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jordyn/res/assets/image_assets.dart';
import 'package:jordyn/res/colors/app_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.buttonColor = AppColor.buttonColor,
    this.textColor = AppColor.whiteTextColor,
    this.subtextColor = AppColor.whiteTextColor,
    this.borderColor = AppColor.buttonColor,
    this.borderShadowColor = const Color(0x1E000000),
    required this.onPress,
    this.height = 50,
    this.imageHeight = 25,
    this.imageWeight = 25,
    this.width = 390,
    this.loading = false,
    this.center = true,
    this.icon = false,
    this.image = ImageAssets.fb,
    required this.title,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w500,
    this.fontFamily = 'Poppins',
    this.radius = 8,
    this.subtitle = '',
    this.subfontSize = 14,
    this.subfontWeight = FontWeight.w400,
    this.subfontFamily = 'Poppins',
  });

  final bool loading, center, icon;
  final String title, subtitle, fontFamily, subfontFamily, image;
  final double height,
      fontSize,
      radius,
      subfontSize,
      width,
      imageHeight,
      imageWeight;
  final Future<void> Function()? onPress;
  final Color textColor,
      subtextColor,
      buttonColor,
      borderColor,
      borderShadowColor;
  final FontWeight fontWeight, subfontWeight;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return InkWell(
          onTap:
              // onPress
              (onPress != null && !loading) ? () => onPress!() : null,
          child: Container(
            height: height,
            width: width,
            decoration: ShapeDecoration(
              color: buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
              // shadows: [
              //   BoxShadow(
              //     color: borderShadowColor,
              //     blurRadius: 4,
              //     offset: Offset(0, 0),
              //     spreadRadius: 0,
              //   ),
              // ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child:
                  loading
                      ? Center(
                        child: CircularProgressIndicator(color: textColor),
                      )
                      : center
                      ? Center(
                        child:
                            subtitle.isEmpty
                                ? Text(
                                  title,
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: fontSize,
                                    fontWeight: fontWeight,
                                    fontFamily: fontFamily,
                                  ),
                                )
                                : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      title,
                                      style: TextStyle(
                                        color: textColor,
                                        fontSize: fontSize,
                                        fontWeight: fontWeight,
                                        fontFamily: fontFamily,
                                      ),
                                    ),
                                    Text(
                                      subtitle,
                                      style: TextStyle(
                                        color: subtextColor,
                                        fontSize: subfontSize,
                                        fontWeight: subfontWeight,
                                        fontFamily: subfontFamily,
                                      ),
                                    ),
                                  ],
                                ),
                      )
                      : Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (icon)
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Image.asset(
                                image,
                                width: imageWeight,
                                height: imageHeight,
                              ),
                            ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: fontSize,
                                    fontWeight: fontWeight,
                                    fontFamily: fontFamily,
                                  ),
                                ),
                                if (subtitle.isNotEmpty)
                                  Text(
                                    subtitle,
                                    style: TextStyle(
                                      color: subtextColor,
                                      fontSize: subfontSize,
                                      fontWeight: subfontWeight,
                                      fontFamily: subfontFamily,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
            ),
          ),
        );
      },
    );
  }
}
