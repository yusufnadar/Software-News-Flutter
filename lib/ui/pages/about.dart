import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_news/core/constants/fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
        child: Text(
          'It is designed only for those who want to learn about software news. You will receive a notification every day at the time you set. The application on recommendations and recommendations is under development. You can access my contact information below.',
          style: regularTextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }
}
