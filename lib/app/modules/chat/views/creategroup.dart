import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jordyn/app/modules/chat/views/creategoup1.dart';


import '../../../../res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/dialogue.dart';
import '../../../../widgets/input_text_widget.dart';
import '../controllers/chat_controller.dart';

class Creategroup extends StatelessWidget {
  final ChatController controller = Get.find();
  Creategroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios_new),

        ),
        title: Text(
          'Create Group',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
        ),
        centerTitle: true,
        leadingWidth: 30.w,
      ),
      body: Obx(() {
        final filteredNames = controller.names
            .where((name) => name
            .toLowerCase()
            .contains(controller.searchQuery.value.toLowerCase()))
            .toList();

        return Column(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: Obx(() => InputTextWidget(

                onChanged: (value) {
                  controller.searchQuery.value = value;
                },
                backIcon: controller.searchQuery.value.isEmpty ? false : true,
                imageIcon: ImageAssets.cross3,
                borderColor: AppColor.backgroundColor,
                hintText: 'Search',
                hintTextColor: AppColor.textGreyColor2,
                leadingIcon: ImageAssets.search,
                textColor: AppColor.textGreyColor2,
                leading: true,
                height: 48.h,
              )),
            ),
            SizedBox(height: 10.h,),
            if (filteredNames.isEmpty)
              SizedBox(
                height: 0.8.sh,
                child: Center(
                  child: Text(
                    'No chat found',
                    style: TextStyle(
                      color: AppColor.greyTone,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            else
              SizedBox(
                height: 0.72.sh,
                child: ListView.builder(

                  itemCount: filteredNames.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        _buildUserTile(filteredNames[index]),
                      ],
                    );
                  },
                ),
              ),
            SizedBox(height: 0.03.sh,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: CustomButton(
                title: 'Next',
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                onPress: () async {
                  Get.to(Creategoup1(),transition: Transition.rightToLeft);
                },
                buttonColor: AppColor.buttonColor,
                height: 50.h,

                radius: 30.r,
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildUserTile(String name) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: ListTile(

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
        trailing: Obx(() => GestureDetector(
          onTap: () {
            controller.toggleSelection(name); // Toggle selection for this user
          },
          child: Container(
            width: 25.w,
            height: 25.h,
            decoration: BoxDecoration(
              color: controller.isSelected(name) ? Colors.blue : Colors.transparent,
              border: Border.all(
                color: controller.isSelected(name) ? Colors.transparent : AppColor.greyTone,
              ),
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: controller.isSelected(name)
                ? Center(
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 20.sp,
              ),
            )
                : null,
          ),
        )),
      ),
    );
  }
}