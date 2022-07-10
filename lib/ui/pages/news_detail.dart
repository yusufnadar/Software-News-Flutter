import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class NewsDetail extends StatelessWidget {
  const NewsDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News Detail'),),
      body: WebViewPlus(initialUrl: Get.arguments['detailLink'],javascriptMode: JavascriptMode.unrestricted,),
    );
  }
}
