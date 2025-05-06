import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jordyn/res/colors/app_color.dart';
import '../../../../res/assets/image_assets.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Welcome back to Inspirit!',
                  style: TextStyle(
                    color: AppColor.greyTone,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            actions: [
              Row(
                children: [
                  Image.asset(ImageAssets.scanner, width: 32),
                  SizedBox(width: 15),
                  Image.asset(ImageAssets.schedule, width: 32),
                  SizedBox(width: 15),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Color(0xFFEAE0D0),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Center(
                          child: Icon(
                            Icons.notifications_none_sharp,
                            size: 30,
                            color: Colors.black87,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 1,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 20,
                              minHeight: 20,
                            ),
                            child: Center(
                              child: Text(
                                '2',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
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
    );
  }

  Widget buildPost() {
    return Container(
      height: 566,
      color: AppColor.backgroundColor,
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 25,
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
                fontSize: 18,
              ),
            ),
            subtitle: Row(
              children: [
                Text('abc_xyz', style: TextStyle(color: AppColor.greyTone)),
                SizedBox(width: 10),
                Text('3s', style: TextStyle(color: AppColor.greyTone)),
              ],
            ),
            trailing: Icon(Icons.more_vert),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sit amet venenatis metus',
              style: TextStyle(color: AppColor.greyTone, fontSize: 16),
            ),
          ),
          SizedBox(height: 10),
          Image.asset(ImageAssets.person),
          SizedBox(height: 10),
          Row(
            children: [
              SizedBox(width: 20),
              SvgPicture.asset(ImageAssets.love, width: 30, height: 30),
              SizedBox(width: 5),
              Text('121', style: TextStyle(color: AppColor.greyTone)),
              SizedBox(width: 20),
              SvgPicture.asset(ImageAssets.achieve, width: 30, height: 30),
              SizedBox(width: 5),
              Text('34', style: TextStyle(color: AppColor.greyTone)),
              SizedBox(width: 20),
              SvgPicture.asset(ImageAssets.share, width: 35, height: 35),
              SizedBox(width: 5),
              Text('Share', style: TextStyle(color: AppColor.greyTone)),
            ],
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
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
                SizedBox(width: 10),
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
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '3s',
                            style:
                            TextStyle(color: AppColor.greyTone, fontSize: 16),
                          ),
                        ],
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                        style:
                        TextStyle(color: AppColor.greyTone, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Column(
                    children: [
                      Image.asset(ImageAssets.heart, width: 20, height: 20),
                      Text('2', style: TextStyle(color: AppColor.greyTone)),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
