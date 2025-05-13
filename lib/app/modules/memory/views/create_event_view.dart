
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/memory/controllers/memory_controller.dart';
import 'package:jordyn/app/modules/memory/views/add_event_view.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../widgets/custom_button.dart';

class CreateEventView extends StatelessWidget {
  final MemoryController controller = Get.find();

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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [ Padding(
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
                  SizedBox(height: 20,),
                  Container(
                    height: 48,
                    width: 390,
                      decoration: ShapeDecoration(
                        color: AppColor.textAreaColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            side: BorderSide(
                              color: AppColor.textAreaColor,
                            )
                        ),
                  ),
                  child: Center(
                    child: Text(
                      'Lorem ipsum dolor sit',
                      style: TextStyle(
                        color: AppColor.textGreyColor,
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: 48,
                    width: 390,
                      decoration: ShapeDecoration(
                        color: AppColor.textAreaColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            side: BorderSide(
                              color: AppColor.textAreaColor,
                            )
                        ),
                  ),
                  child: Center(
                    child: Text(
                      'Vestibulum a pretium turpis',
                      style: TextStyle(
                        color: AppColor.textGreyColor,
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: 48,
                    width: 390,
                      decoration: ShapeDecoration(
                        color: AppColor.textAreaColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            side: BorderSide(
                              color: AppColor.textAreaColor,
                            )
                        ),
                  ),
                  child: Center(
                    child: Text(
                      'Duis sed bibendum elit',
                      style: TextStyle(
                        color: AppColor.textGreyColor,
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: 48,
                    width: 390,
                      decoration: ShapeDecoration(
                        color: AppColor.textAreaColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            side: BorderSide(
                              color: AppColor.textAreaColor,
                            )
                        ),
                  ),
                  child: Center(
                    child: Text(
                      'Curabitur volutpat hendrerit augue',
                      style: TextStyle(
                        color: AppColor.textGreyColor,
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: 48,
                    width: 390,
                      decoration: ShapeDecoration(
                        color: AppColor.textAreaColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            side: BorderSide(
                              color: AppColor.textAreaColor,
                            )
                        ),
                  ),
                  child: Center(
                    child: Text(
                      'Aliquam nec mauris bibendum',
                      style: TextStyle(
                        color: AppColor.textGreyColor,
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: 48,
                    width: 390,
                      decoration: ShapeDecoration(
                        color: AppColor.textAreaColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            side: BorderSide(
                              color: AppColor.textAreaColor,
                            )
                        ),
                  ),
                  child: Center(
                    child: Text(
                      'Fusce pulvinar leo sapien',
                      style: TextStyle(
                        color: AppColor.textGreyColor,
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ),
                  SizedBox(height: 15,),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                CustomButton(
                  title: 'Next',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  onPress: () async {
                    Get.to(AddEventView(),transition: Transition.noTransition,arguments: {'origin': 'HomeView'});
                  },
                  buttonColor: AppColor.buttonColor,
                  height: 50,
                  radius: 30.r,
                ),
                SizedBox(height: 30,)
              ],
            ),
          ),
        ],
      ),
    );
  }

}
