import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:software_news/core/constants/colors.dart';
import 'package:software_news/core/constants/fonts.dart';
import 'package:software_news/services/notification_service.dart';

class NotificationsController extends GetxController {
  final RxBool _isNotification =
      GetStorage().read('isNotification') != null ? true.obs : false.obs;

  bool get isNotification => _isNotification.value;

  set isNotification(bool value) => _isNotification.value = value;

  // ignore: prefer_null_aware_operators
  TimeOfDay? time = GetStorage().read('time') != null ? TimeOfDay(hour:int.parse(GetStorage().read('time').split(":")[0]),minute: int.parse(GetStorage().read('time').split(":")[1])) : null;

  // TimeOfDay? get time => _time?.value;
  //
  // set time(TimeOfDay? value) => _time?.value = value;

  void changeNotification(bool value) async {
    isNotification = value;
    update();
    await GetStorage().write('isNotification', value);
    if (!value) {
      Get.snackbar('Message', 'Notifications Canceled',duration: Duration(milliseconds: 1500),dismissDirection: DismissDirection.horizontal);
      NotificationApi.cancel();
    }else{
      if(time != null){
        await Get.snackbar('Message', 'Notifications Enabled',duration: Duration(milliseconds: 1500),dismissDirection: DismissDirection.horizontal);
        await NotificationApi.createWaterReminderNotification(hour: time!.hour,minute: time!.minute);
      }
    }
  }

  Future<void> changeTime(TimeOfDay pickerDate) async {
    time = pickerDate;
    update();
    await GetStorage().write('time', '${pickerDate.hour}:${pickerDate.minute}');
  }
}

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(TimeOfDay(hour: 9, minute: 12));
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: primaryColor),
        elevation: 0,
        title: const Text(
          'Notification Settings',
        ),
      ),
      body: GetBuilder<NotificationsController>(
        init: NotificationsController(),
        builder: (controller) => Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.05,
            vertical: Get.height * 0.02,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Notifications',
                    style: regularTextStyle(fontSize: 16),
                  ),
                  Switch(
                    value: controller.isNotification,
                    activeColor: primaryColor,
                    inactiveThumbColor: primaryColor.withOpacity(0.6),
                    onChanged: (value) {
                      controller.changeNotification(value);
                    },
                  )
                ],
              ),
              SizedBox(height: Get.height * 0.04),
              GestureDetector(
                onTap: () async {
                  if (controller.isNotification) {
                    var pickerDate = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay(
                        hour: DateTime.now().hour,
                        minute: DateTime.now().minute + 1,
                      ),
                    );
                    if (pickerDate != null) {
                      Get.snackbar('Message', 'Notification Time Set ${DateFormat.Hm().format(DateTime.now().applied(pickerDate))}',duration: Duration(milliseconds: 1500),dismissDirection: DismissDirection.horizontal);
                      await controller.changeTime(pickerDate);
                      NotificationApi.createWaterReminderNotification(
                        hour: pickerDate.hour,
                        minute: pickerDate.minute,
                      );
                    }
                  }
                },
                child: Container(
                  decoration: BoxDecoration(),
                  margin: EdgeInsets.only(right: Get.width * 0.025),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.time != null
                            ? '${DateFormat.Hm().format(DateTime.now().applied(controller.time!))}'
                            : 'Choose Time',
                        style: regularTextStyle(
                          fontSize: 16,
                          color: GetStorage().read('isNotification') != true
                              ? Colors.grey
                              : primaryColor,
                        ),
                      ),
                      Image.asset(
                        'assets/images/clock.png',
                        color: GetStorage().read('isNotification') != true
                            ? Colors.grey
                            : primaryColor,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension DateTimeExtension on DateTime {
  DateTime applied(TimeOfDay time) {
    return DateTime(year, month, day, time.hour, time.minute);
  }
}
