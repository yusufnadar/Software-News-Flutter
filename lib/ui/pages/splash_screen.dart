import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:software_news/core/constants/colors.dart';
import 'package:software_news/services/notification_service.dart';
import 'package:software_news/ui/pages/home_page.dart';

class SplashScreenController extends GetxController{

  @override
  void onInit() {
    super.onInit();
    if(GetStorage().read('time') == null){
      GetStorage().write('time','09:00');
      NotificationApi.createWaterReminderNotification(
        hour: 9,
        minute: 0,
      );
    }
    if(GetStorage().read('isNotification') == null){
      GetStorage().write('isNotification',true);
    }
    Future.delayed(const Duration(seconds: 2)).then((value) => Get.offAll(()=>HomePage()));
  }

}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Image.asset('assets/images/news.png',height: Get.height*0.2,),
      ),
    );
  }
}
