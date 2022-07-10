import 'package:get/get.dart';
import 'package:software_news/controller/news_controller.dart';
import 'package:software_news/services/notification_service.dart';

class AllBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<NewsController>(NewsController());
    Get.put<NotificationApi>(NotificationApi());
  }
}