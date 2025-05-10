import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/chat/views/personalchat.dart';
import 'package:jordyn/app/modules/profile/controllers/profile_controller.dart';
import 'package:jordyn/app/modules/profile/views/search_friend_list_view.dart';
import 'package:jordyn/res/assets/image_assets.dart';
import 'package:jordyn/res/colors/app_color.dart';
import 'package:jordyn/widgets/input_text_widget.dart';

class FriendListView extends GetView {
  final ProfileController controller = Get.put(ProfileController());
   FriendListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, size: 20.sp),
        ),
        title: Text(
          'Friend List',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
            fontFamily: 'Montserrat',
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: InputTextWidget(
              onTap: (){ Get.to(SearchFriendListView(),transition: Transition.rightToLeft);},
              onChanged: (e) {},
              borderColor: AppColor.backgroundColor,
              hintText: 'Search',
              readOnly: true,
              hintTextColor: AppColor.textGreyColor2,
              leadingIcon: ImageAssets.search,
              textColor: AppColor.textGreyColor2,
              leading: true,
              height: 48.h,
            ),
          ),
          SizedBox(height: 10.h,),
          Expanded(
            child: ListView.builder(
              itemCount: controller.names.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: GestureDetector(
                    onTap: (){
                      Get.to(Personalchat(name: controller.names[index],),transition: Transition.rightToLeft);
                    },
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
                        controller.names[index],
                        style: TextStyle(
                          color: AppColor.darkGrey,
                          fontWeight: FontWeight.w600,
                          fontSize: 17.sp,
                        ),
                      ),
                      subtitle: Text(
                        'Thanks everyone',
                        style: TextStyle(
                          color: AppColor.greyTone,
                          fontSize: 15.sp,
                        ),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(height: 5.h),
                          Container(
                            width: 94.w,
                            height: 36,
                            decoration: ShapeDecoration(
                              color: AppColor.backgroundColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  side: BorderSide(
                                    color: AppColor.textSendColor,
                                  )
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'remove',
                                style: TextStyle(
                                  color: AppColor.textSendColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}
