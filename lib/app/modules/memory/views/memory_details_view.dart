import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jordyn/app/modules/home/views/navbar.dart';
import 'package:jordyn/app/modules/memory/controllers/memory_controller.dart';
import 'package:jordyn/app/modules/memory/views/edit_info_memory_view.dart';
import 'package:jordyn/app/modules/memory/views/memory_history_view.dart';
import 'package:jordyn/app/modules/memory/views/qr_code_view.dart';
import 'package:jordyn/res/assets/image_assets.dart';
import 'package:jordyn/res/colors/app_color.dart';
import 'package:jordyn/widgets/custom_button.dart';
import 'package:jordyn/widgets/deleteconfirmationwidget.dart';

class MemoryDetailsView extends GetView<MemoryController> {
  const MemoryDetailsView({super.key});

  void _showPopupMenu(BuildContext context, Offset position) {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject()! as RenderBox;
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy + 20,
        overlay.size.width - position.dx,
        overlay.size.height - position.dy,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: AppColor.backgroundColor,
      constraints: const BoxConstraints(maxWidth: 144, minWidth: 144),
      items: [
        PopupMenuItem(
          height: 60,
          padding: EdgeInsets.zero,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 144, minWidth: 144),
            child: ClipRect(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Text(
                      'QR Code',
                      style: TextStyle(
                        color: AppColor.textGreyColor,
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Get.to(QrCodeView(), transition: Transition.noTransition);
                    },
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    child: Text(
                      'Edit Info',
                      style: TextStyle(
                        color: AppColor.textGreyColor,
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Get.to(
                        EditInfoMemoryView(),
                        transition: Transition.noTransition,
                      );
                      // Get.dialog(
                      //   RenameDialog(
                      //     title: 'Rename the note?',
                      //     onConfirm: () {},
                      //   ),
                      // );
                    },
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    child: Text(
                      'Delete Person',
                      style: TextStyle(
                        color: AppColor.textGreyColor,
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      showDeleteConfirmationPopup(
                        context: context,
                        title: 'Are You Sure?',
                        subtitle:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse elementum ',
                        onDelete: () {
                          // Your delete logic here
                          // print("Deleted");
                        }, arguments: 'MemoryView'
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Scaffold(
          body: Stack(
            children: [
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(
                  ImageAssets.memoryBackground,
                  fit: BoxFit.fill,
                ),
              ),
              SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(Navigation(), transition: Transition.leftToRight);
                            },
                            child: Image.asset(
                              ImageAssets.back_arrow,
                              height: 28,
                              width: 28,
                            ),
                          ),
                          GestureDetector(
                            onTapDown: (details) {
                              _showPopupMenu(context, details.globalPosition);
                            },
                            child: Image.asset(ImageAssets.menu),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 10.h),
                            Image.asset(ImageAssets.image1),
                            SizedBox(height: 20.h),
                            Text(
                              'Sophia Johnson',
                              style: TextStyle(
                                color: AppColor.buttonColor,
                                fontSize: 22,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              '1992 - 1024',
                              style: TextStyle(
                                color: AppColor.subTitleGrey,
                                fontSize: 16,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Morbi vitae libero libero. Quisque\nviverra semper eros in ultrices. Cras vel augue\ntristique, gravida nulla a, blandit ex.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColor.greyTone,
                                fontSize: 16,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Text(
                              'Lorem ipsum dolor sit amet',
                              style: TextStyle(
                                color: AppColor.textSendColor,
                                fontSize: 16,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    ImageAssets.candle,
                                    height: 200,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Expanded(
                                  child: Image.asset(
                                    ImageAssets.flower1,
                                    height: 200,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 40.h),
                            CustomButton(
                              onPress: () async {
                                Get.to(
                                  MemoryHistoryView(),
                                  transition: Transition.noTransition,
                                );
                              },
                              title: 'View Obituary',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                              textColor: AppColor.buttonColor,
                              borderColor: AppColor.buttonColor,
                              buttonColor: Colors.transparent,
                              height: 48,
                              width: double.infinity,
                              radius: 10,
                            ),
                            SizedBox(height: 40.h),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

}
