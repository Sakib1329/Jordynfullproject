import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/memory/controllers/memory_controller.dart';
import 'package:jordyn/app/modules/memory/views/add_event_view.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../widgets/custom_button.dart';

class CreateEventView extends StatelessWidget {
  final MemoryController controller = Get.find();

  final List<String> options = [
    'Lorem ipsum dolor sit',
    'Vestibulum a pretium turpis',
    'Duis sed bibendum elit',
    'Curabitur volutpat hendrerit augue',
    'Aliquam nec mauris bibendum',
    'Fusce pulvinar leo sapien',
  ];

  CreateEventView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, size: 20),
        ),
        title: Text(
          'Create Event',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        'Vestibulum sodales pulvinar accumsan raseing rhoncus neque',
                        style: TextStyle(
                          color: AppColor.textGreyColor,
                          fontSize: 20,
                          fontFamily: 'Schuyler',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 20),
                    ...List.generate(
                      options.length,
                          (index) => Obx(() {
                        final isSelected = controller.selectedIndex.value == index;
                        return GestureDetector(
                          onTap: () {
                            controller.selectOption(index, options[index]);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            height: 48,
                            width: double.infinity,
                            decoration: ShapeDecoration(
                              color: isSelected
                                  ? AppColor.buttonColor
                                  : AppColor.textAreaColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                side: BorderSide(
                                  color: AppColor.textAreaColor,
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                options[index],
                                style: TextStyle(
                                  color: isSelected
                                      ? AppColor.whiteTextColor
                                      : AppColor.textGreyColor,
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
            Obx(() {
              final isEnabled = controller.selectedIndex.value != -1;
              return Column(
                children: [
                  CustomButton(
                    title: 'Next',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    onPress: isEnabled
                        ? () async{
                      Get.to(
                        AddEventView(),
                        transition: Transition.noTransition,
                        arguments: {
                          'origin': 'HomeView',
                          'selectedOption':
                          controller.selectedeventtype.value,
                        },
                      );
                    }
                        : null,
                    buttonColor: isEnabled
                        ? AppColor.buttonColor
                        : AppColor.textGreyColor.withOpacity(0.5),
                    height: 50,
                    radius: 30.r,
                  ),
                  SizedBox(height: 30),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
