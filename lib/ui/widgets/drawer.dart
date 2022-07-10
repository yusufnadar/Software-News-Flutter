import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_news/core/constants/colors.dart';
import 'package:software_news/core/constants/fonts.dart';
import 'package:software_news/ui/pages/about.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: Get.width * 0.7,
        child: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.03,
                  vertical: Get.height * 0.02,
                ),
                child: Image.asset(
                  'assets/images/news.png',
                  height: Get.height * 0.1,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.03,
                ),
                margin: EdgeInsets.only(
                    bottom: Get.height * 0.02),
                child: Text(
                  'Software News',
                  style: regularTextStyle(fontSize: 18),
                ),
              ),
              Container(
                height: 1,
                width: Get.width,
                color: Colors.grey.shade300
              ),
              GestureDetector(
                onTap: ()=>Get.to(()=>About()),
                child: Container(
                  decoration: BoxDecoration(),
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.03,
                    vertical: Get.height*0.03
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'About',
                        style: regularTextStyle(fontSize: 18),
                      ),
                      Image.asset(
                        'assets/images/info.png',
                        color: primaryColor,
                        width: 20,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
