import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/explore/views/event_view.dart';
import 'package:jordyn/res/assets/image_assets.dart';
import 'package:jordyn/res/colors/app_color.dart';

class MemoryHistoryListView extends GetView {
  const MemoryHistoryListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.09.sh),
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: ListView.builder(
          itemCount: 50,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.to(EventView(), transition: Transition.noTransition);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0,right: 15,top: 10),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 6.5,top: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              width: 2.w,
                              color: AppColor.buttonColor,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 17, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Title of Memory",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: AppColor.textSendColor,
                                ),
                              ),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Added by Jahan_zaib",
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: AppColor.textGreyColor2,
                                    ),
                                  ),
                                  Text(
                                    "December 1st, 2015",
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16,
                                      color: AppColor.textGreyColor2,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [ Image.asset(ImageAssets.image),
                                  Container(
                                    height: 130,
                                    width: 130,
                                    decoration: BoxDecoration(
                                      borderRadius:BorderRadius.circular(10),
                                    ),
                                    child: Image.asset(ImageAssets.image,
                                      height: 130,
                                      width: 130,),
                                  ),
                                  Container(
                                    height: 130,
                                    width: 130,
                                    decoration: BoxDecoration(
                                      borderRadius:BorderRadius.circular(10),
                                    ),
                                    child: Image.asset(ImageAssets.image),
                                  ),
                                ],
                              ),
                              Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vitae libero libero. Quisque viverra semper eros in ultrices. Cras vel augue tristique, gravida nulla a, blandit ex.",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: AppColor.textGreyColor2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(ImageAssets.border),
                        SizedBox(width: 10),
                        Text(
                          "2015",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: AppColor.textGreyColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
