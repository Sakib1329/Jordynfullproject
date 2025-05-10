import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jordyn/app/modules/chat/views/addmembers.dart';
import 'package:jordyn/app/modules/chat/views/chat.dart';
import 'package:jordyn/app/modules/chat/views/creategoup1.dart';
import 'package:jordyn/app/modules/chat/views/request.dart';
import 'package:jordyn/app/modules/chat/views/viewall.dart';
import 'package:jordyn/app/modules/home/views/navbar.dart';

import '../../../../res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../widgets/deleteconfirmationwidget.dart';
import '../../../../widgets/dialogue.dart';
import '../controllers/bottomsheetcontroller.dart';
import '../controllers/chat_controller.dart';
import '../widget/optionmenu.dart';

class Groupinfopage extends StatelessWidget {
  final BottomSheetController bs = Get.find();
  final ChatController controller = Get.find();
  RxBool reqincoming=false.obs;
  Groupinfopage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        actions: [ Obx(() => CustomAppBarMenu(
          options: controller.isuserblocked.value
              ? ['Clear Chat','Unblock User']
              : [ 'Edit ', 'Mute', 'Clear Chat','Delete Group'],
          onSelected: (value) {
            if (value == 'View Info') {
              Get.to(Groupinfopage(), transition: Transition.rightToLeft);
            }
            else if (value == 'Delete Group') {
              showDeleteConfirmationPopup(
                context: context,
                title: 'Are You Sure?',
                subtitle:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse elementum ',
                onDelete: () {
                  Get.to(Navigation(),transition: Transition.rightToLeft);
                },
              );
            }
            // Add more logic as needed
          },
        )),],
        leadingWidth: 30.w,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 60.r,
                  backgroundColor: Colors.white24,
                  child: Obx(() {
                    final file = bs.pickedImage.value;

                    return ClipRRect(
                      borderRadius: BorderRadius.circular(60.r),
                      child:
                          file != null
                              ? Image.file(
                                file,
                                width: 100.w,
                                height: 100.w,
                                fit: BoxFit.cover,
                              )
                              : Container(
                                width: 100.w,
                                height: 100.w,
                                color: AppColor.mutedBlueGrey,
                                child: Image.asset(ImageAssets.group),
                              ),
                    );
                  }),
                ),
              ),
              Text(
                'Dummy name',
                style: TextStyle(
                  color: AppColor.textBlackColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),

              ),
              SizedBox(height: 15.h,),

              Text(
                'Lorem ipsum dolor sit amet, consectetur adipisc ewying elit. Morbi vitae libero libero.',
                style: TextStyle(
                  color: AppColor.textGreyColor,
                  fontSize: 18.sp,
                  fontFamily: 'Schuyler',
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 15.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Media',
                    style: TextStyle(
                      color: AppColor.textBlackColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),

                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(Viewall(),transition: Transition.rightToLeft);
                    },
                    child: Text(
                      'View All',
                      style: TextStyle(
                        color: AppColor.textGreyColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300,
                      ),

                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 150.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,

                  itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.only(right: 10.0.w,top: 8.2,bottom: 8.w,),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: Container(
                          width: 150.w,

                          color: Colors.black, // Background color if image fails to load
                          child: Image.asset(
                            ImageAssets.person,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10.h,),


              //Req portion*************************************************************************
              if(reqincoming==false)
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Requests',
                            style: TextStyle(
                              color: AppColor.textBlackColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),

                          ),
                          SizedBox(width: 5.w,),
                          Text(
                            '(6)',
                            style: TextStyle(
                              color: AppColor.textGreyColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w300,
                            ),

                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.to(Request(),transition: Transition.rightToLeft);
                        },
                        child: Text(
                          'View All',
                          style: TextStyle(
                            color: AppColor.textGreyColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w300,
                          ),

                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  ListView.builder(
                    padding: EdgeInsets.all(0),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          _buildURequestTile(controller.names[index]),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 10.h,),
                ],
              ),
//Members********************
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Members',
                        style: TextStyle(
                          color: AppColor.textBlackColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),

                      ),
                      SizedBox(width: 5.w,),
                      Text(
                        '(12)',
                        style: TextStyle(
                          color: AppColor.textGreyColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w300,
                        ),

                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: (){
Get.to(Addmembers(),transition: Transition.rightToLeft);
                    },
                    child: Text(
                      'Add  Members',
                      style: TextStyle(
                        color: AppColor.buttonColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),

                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h,),
              ListView.builder(
                padding: EdgeInsets.all(0),
              physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.names.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      _buildUserTile(controller.names[index]),
                    ],
                  );
                },
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.w),
                child: ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: Icon(CupertinoIcons.delete,size: 30,color: AppColor.deepred,),
                  title:   Text(
                    'Delete Group',
                    style: TextStyle(
                      color: AppColor.textBlackColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),

                  ),
                ),
              ),
              SizedBox(height: 20.h,)
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildUserTile(String name) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          radius: 28.r,
          backgroundColor: Colors.grey[300],
          child: ClipOval(
            child: Image.asset(
              ImageAssets.person2,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
        title: Text(
          name,
          style: TextStyle(
            color: AppColor.darkGrey,
            fontWeight: FontWeight.w600,
            fontSize: 17.sp,
          ),
        ),
        subtitle: Text(
          '_${name}',
          style: TextStyle(
            color: AppColor.greyTone,
            fontSize: 15.sp,

          ),
        ),
        trailing:Text(
          'Remove',
          style: TextStyle(
            color: AppColor.greyTone,
            fontSize: 15.sp,
            fontWeight: FontWeight.w400
          ),
        ),
      ),
    );
  }
  Widget _buildURequestTile(String name) {
    return Container(
padding: EdgeInsets.symmetric(vertical: 8.h),

      child: Row(
        children: [
          // Leading icon (CircleAvatar)
          CircleAvatar(
            radius: 28.r,
            backgroundColor: Colors.grey[300],
            child: ClipOval(
              child: Image.asset(
                ImageAssets.person2,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          SizedBox(width: 12.r), // Spacing between avatar and text

          // Title and subtitle
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: AppColor.darkGrey,
                  fontWeight: FontWeight.w600,
                  fontSize: 17.sp,
                ),
              ),
              SizedBox(height: 4.r),
              Text(
                '_${name}',
                style: TextStyle(
                  color: AppColor.greyTone,
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
          Spacer(), // This pushes the trailing to the far right

          // Trailing images (reject and accept)
          SizedBox(
            width: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(ImageAssets.reject,width: 50,),
                SizedBox(width: 8.r),
                Image.asset(ImageAssets.accept,width: 50),
              ],
            ),
          ),
        ],
      ),
    );

  }
}
