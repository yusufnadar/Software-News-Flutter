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
        padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.05),
        child: Column(
          children: [
            Text(
              'It is designed only for those who want to learn about software news. You will receive a notification every day at the time you set. The application on recommendations and recommendations is under development. You can access my contact information below.',
              style: regularTextStyle(fontSize: 20,color: Colors.black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: ()=>launchUrl(Uri.parse('https://www.linkedin.com/in/yusuf-nadaro%C4%9Flu/'),mode: LaunchMode.externalNonBrowserApplication),
                  child: Image.asset(
                    'assets/images/linkedin.png',
                    width: 34,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: Get.width * 0.05,
                      vertical: Get.height * 0.03),
                  child: GestureDetector(
                    onTap: ()=>launchUrl(Uri.parse('https://www.instagram.com/nadarogluyusuf/'),mode: LaunchMode.externalNonBrowserApplication),
                    child: Image.asset(
                      'assets/images/instagram.png',
                      width: 34,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: ()=>launchUrl(Uri.parse('mailto:yusufnadaroglu@gmail.com')),
                  child: Image.asset(
                    'assets/images/gmail.png',
                    width: 34,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
