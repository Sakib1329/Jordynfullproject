import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/home/views/comment.dart';
import 'package:jordyn/app/modules/home/views/createpost.dart';
import 'package:jordyn/app/modules/home/views/schedule.dart';
import 'package:jordyn/app/modules/memory/views/add_memory_view.dart';
import 'package:jordyn/app/modules/memory/views/create_event_view.dart';
import 'package:jordyn/res/colors/app_color.dart';
import '../../../../res/assets/image_assets.dart';
import '../controllers/home_controller.dart';
import '../widget/scanner.dart';
import 'notification.dart';

class HomeView extends StatelessWidget {

  final String? arguments;
  final HomeController controller = Get.put(HomeController());
  HomeView({super.key, this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                floating: true,
                snap: true,
                backgroundColor: AppColor.backgroundColor,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, Audrey',
                      style: TextStyle(
                        color: AppColor.textTitleColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                    Text(
                      'Welcome back to Inspirit!',
                      style: TextStyle(
                        color: AppColor.textGreyColor,
                        fontSize: 15.sp,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
                actions: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: (){

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => QRScannerWidget(
                                  onDetect: (code) {
                                    // handle scanned code
                                    print('QR Code: $code');
                                    Navigator.pop(context); // Optional: close scanner after scan
                                  },
                                ),
                              ),
                            );
                          },
                          child: Image.asset(ImageAssets.scanner, width: 30.w)),
                      SizedBox(width: 15.w),
                      GestureDetector(onTap:(){
                        Get.to(Schedule(arguments: arguments),transition: Transition.rightToLeft);

                      },child: Image.asset(ImageAssets.schedule, width: 30.w)),
                      SizedBox(width: 15.w),
                      Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          color: Color(0xFFEAE0D0),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: GestureDetector(
                          onTap: (){
                            Get.to(HomeNotification(),transition: Transition.rightToLeft);
                          },
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Center(
                                child: Icon(
                                  Icons.notifications_none_sharp,
                                  size: 35.sp,
                                  color: Colors.black87,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 1,
                                child: Container(
                                  padding: EdgeInsets.all(4.w),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  constraints: BoxConstraints(
                                    minWidth: 20.w,
                                    minHeight: 20.h,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '2',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                    ],
                  )
                ],
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    return buildPost();
                  },
                  childCount: 20,
                ),
              ),
            ],
          ),
          Obx(() => controller.isFabMenuOpen.value
              ? GestureDetector(
            onTap: () => controller.isFabMenuOpen.value = false,
            child: Container(color: Colors.black54),
          )
              : SizedBox()),
          Obx(() => controller.isFabMenuOpen.value
              ? Positioned(
            bottom: 80.h,
            right: 70.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _fabOption(label: 'Create Event',ontap: (){Get.to(CreateEventView(),transition: Transition.rightToLeft);}),
                SizedBox(height: 12.h),
                _fabOption(label: 'Create Post',ontap: (){Get.to(Createpost(),transition: Transition.rightToLeft);}),
                SizedBox(height: 12.h),
                _fabOption(label: 'Create Memory',ontap: (){Get.to(AddMemoryView(),transition: Transition.rightToLeft);}),
              ],
            ),
          )
              : SizedBox()),
        ],
      ),
      floatingActionButton: Obx(() => Padding(
        padding: EdgeInsets.only(right: 8.w, bottom: 8.h),
        child: Transform.rotate(
          angle: controller.isFabMenuOpen.value
              ? 45 * 3.1416 / 180
              : 90 * 3.1416 / 180,
          child: FloatingActionButton(
            onPressed: () => controller.isFabMenuOpen.toggle(),
            backgroundColor: AppColor.beigeBrown,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Icon(
              Icons.add,
              size: 40.sp,
              color: AppColor.whiteTextColor,
            ),
          ),
        ),
      )),
    );
  }

  Widget buildPost() {
    return Container(
      width: double.infinity,
      color: AppColor.backgroundColor,
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 25.r,
              backgroundColor: Colors.grey[300],
              child: ClipOval(
                child: Image.asset(
                  ImageAssets.person,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            title: Text(
              'Dummy Name',
              style: TextStyle(
                color: AppColor.textBlackColor,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ),
            subtitle: Row(
              children: [
                Text('abc_xyz', style: TextStyle(color: AppColor.greyTone)),
                SizedBox(width: 10.w),
                Text('3s', style: TextStyle(color: AppColor.greyTone)),
              ],
            ),
            trailing: Icon(Icons.more_vert),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sit amet venenatis metus',
              style: TextStyle(color: AppColor.greyTone, fontSize: 16.sp),
            ),
          ),
          SizedBox(height: 5.h),
          SizedBox(
              height: 300.h,
              width: double.infinity,
              child: Image.asset(ImageAssets.person)),
          SizedBox(height: 2.h),
          Row(
            children: [
              SizedBox(width: 20.w),
              SvgPicture.asset(ImageAssets.love, width: 30.w, height: 30.h),
              SizedBox(width: 5.w),
              Text('121', style: TextStyle(color: AppColor.greyTone)),
              SizedBox(width: 20.w),
              GestureDetector(
                onTap: () {
                  Get.to(Comment(), transition: Transition.rightToLeft);
                },
                child:
                SvgPicture.asset(ImageAssets.achieve, width: 30.w, height: 30.h),
              ),
              SizedBox(width: 5.w),
              Text('34', style: TextStyle(color: AppColor.greyTone)),
              SizedBox(width: 20.w),
              SvgPicture.asset(ImageAssets.share, width: 35.w, height: 35.h),
              SizedBox(width: 5.w),
              Text('Share', style: TextStyle(color: AppColor.greyTone)),
            ],
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20.r,
                  backgroundColor: Colors.grey[300],
                  child: ClipOval(
                    child: Image.asset(
                      ImageAssets.person,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Maryam',
                            style: TextStyle(
                              color: AppColor.darkGrey,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            '3s',
                            style: TextStyle(
                                color: AppColor.greyTone, fontSize: 16.sp),
                          ),
                        ],
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                        style:
                        TextStyle(color: AppColor.greyTone, fontSize: 14.sp),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25.h),
                  child: Column(
                    children: [
                      Image.asset(ImageAssets.heart, width: 20.w, height: 20.h),
                      Text('2', style: TextStyle(color: AppColor.greyTone)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _fabOption({required String label,required VoidCallback? ontap}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 200.w,
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: AppColor.backgroundColor,
          borderRadius: BorderRadius.circular(30.r),
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 6.r),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: AppColor.textGreyColor,
              letterSpacing: 1,
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
    );
  }
}
