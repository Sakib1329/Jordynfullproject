import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/chat/views/creategroup.dart';
import 'package:jordyn/app/modules/chat/views/personalchat.dart';
import 'package:jordyn/app/modules/chat/views/search.dart';
import 'package:jordyn/res/colors/app_color.dart';

import '../../../../res/assets/image_assets.dart';
import '../../../../widgets/input_text_widget.dart';
import '../controllers/chat_controller.dart';

class Chat extends StatelessWidget {
  final ChatController controller = Get.put(ChatController());
  Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            title: Text(
              'Chat',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: IconButton(
                  onPressed: () {
                    Get.to(Creategroup(), transition: Transition.rightToLeft);
                  },
                  icon: Icon(
                    Icons.add_circle_outline,
                    size: 30,
                    color: AppColor.textBlackColor,
                  ),
                ),
              ),
            ],

          ),

          // Search Bar stays always visible after AppBar
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 10.h),
              child: InputTextWidget(
                onTap: () {
                  Get.to(Search(), transition: Transition.rightToLeft);
                },
                onChanged: (e) {},
                borderColor: AppColor.backgroundColor,
                hintText: 'Search',
                readOnly: true,
                hintTextColor: AppColor.textGreyColor2,
                leadingIcon: ImageAssets.search,
                textColor: AppColor.textGreyColor2,
                leading: true,
                height: 48,
              ),
            ),
          ),

          // Chat List
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(
                        Personalchat(name: controller.names[index]),
                        transition: Transition.rightToLeft,
                      );
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
                          fontSize: 17,
                        ),
                      ),
                      subtitle: Text(
                        'Thanks everyone',
                        style: TextStyle(
                          color: AppColor.greyTone,
                          fontSize: 15,
                        ),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(height: 5.h),
                          Text(
                            '8:25 PM',
                            style: TextStyle(
                              color: AppColor.greyTone,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.r),
                              color: AppColor.vividBlue,
                            ),
                            child: Center(
                              child: Text(
                                '3',
                                style: TextStyle(
                                  color: Colors.white,
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
              childCount: controller.names.length,
            ),
          ),
        ],
      ),
    );
  }
}
