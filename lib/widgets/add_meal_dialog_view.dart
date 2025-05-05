
import 'package:flutter/material.dart';
import 'package:jordyn/res/colors/app_color.dart';
import 'package:jordyn/widgets/input_text_widget.dart';

class AddMealDialogView extends StatelessWidget {
  final VoidCallback onConfirm;
  final String title;

  const AddMealDialogView({
    Key? key,
    required this.onConfirm,
    this.title = 'Enter meal name',
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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
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
                )
              ),
              InputTextWidget(
                clock: true,
                hintText: 'Enter here',
                horizontal: 0,borderColor: AppColor.backgroundColor,
                onChanged: (e) {},
                hintfontWeight: FontWeight.w300,
                hintTextColor: Color(0xFFB5B6BB),
                hintfontSize: 16,
                hintfontFamily: 'Roboto',
              ),
              Divider(height: 1,color: Color(0xFFEAEAEA),),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: ShapeDecoration(
                    color: const Color(0xFF090F03),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 8,
                    children: [
                      Text(
                        'Done',
                        style: TextStyle(
                          color: const Color(0xFFEEEEEE),
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
