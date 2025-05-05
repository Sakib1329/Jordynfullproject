
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jordyn/res/colors/app_color.dart';

// onTap: () {
// Navigator.pop(context);
// Get.dialog(
// RenameDialog(
// title: 'Rename the note?',
// onConfirm: () {},
// ),
// );
// },

class AddDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  final String title;

  const AddDialog({
    Key? key,
    required this.onConfirm,
    this.title = 'Enter serving or portion',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: AppColor.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Align(
              //   alignment: Alignment.topRight,
              //   child: IconButton(
              //     icon: SvgPicture.asset(
              //       ImageAssets.cross,
              //       height: 24,
              //       width: 24,
              //       color: AppColor.defaultColor,
              //     ),
              //     onPressed: () => Get.back(),
              //   ),
              // ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  title,
                  style: TextStyle(
                    color: const Color(0xFF2E3038),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Ex. 1,2, 3 etc.',
                  hintStyle: TextStyle(
                    color: const Color(0xFFB5B6BB),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w300,
                  ),
                  border: InputBorder.none,
                ),
                style: const TextStyle(
                  color: AppColor.textColor,
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w300,
                ),
              ),
              Divider(height: 1, color: AppColor.hintTextColor),
              const SizedBox(height: 60),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                    onConfirm();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(106, 35),
                  ),
                  child: Text(
                    'Set',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColor.whiteTextColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
