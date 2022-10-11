import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constants/colors.dart';

class Contact extends StatelessWidget {
  Contact({Key? key}) : super(key: key);

  final contactList = [
    {
      'title': 'Phone Number',
      'subtitle': '+90 552 933 96 68',
      'image': 'assets/images/call.png',
      'url': 'tel:+905529339668'
    },
    {
      'title': 'Email Address',
      'subtitle': 'yusufnadaroglu@gmail.com',
      'image': 'assets/images/gmail.png',
      'url': 'mailto:yusufnadaroglu@gmail.com'
    },
    {
      'title': 'Instagram',
      'subtitle': 'nadarogluyusuf',
      'image': 'assets/images/instagram.png',
      'url': 'https://www.instagram.com/nadarogluyusuf/'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: primaryColor),
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        title: const Text(
          'Contact',
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            3,
            (index) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => launchUrl(
                      Uri.parse(contactList[index]['url']!),
                      mode: LaunchMode.externalNonBrowserApplication),
                  child: Image.asset(
                    contactList[index]['image']!,
                    width: 24,
                  ),
                ),
                SizedBox(width: Get.width*0.03),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contactList[index]['title']!,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: primaryColor,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: Get.height * 0.004,
                        bottom: Get.height * 0.03,
                      ),
                      child: Text(
                        contactList[index]['subtitle']!,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
