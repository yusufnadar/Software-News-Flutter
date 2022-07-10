import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:software_news/core/constants/colors.dart';
import 'package:software_news/core/constants/fonts.dart';
import 'package:software_news/services/binding.dart';
import 'package:software_news/ui/pages/home_page.dart';
import 'package:software_news/ui/pages/splash_screen.dart';
import 'package:timezone/data/latest.dart' as tz;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Software News',
      initialBinding: AllBindings(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade100,
        appBarTheme: AppBarTheme(
          color: Colors.grey.shade100,
          elevation: 0,
          iconTheme: IconThemeData(color: primaryColor),
          titleTextStyle: regularTextStyle(fontSize: 20),
          titleSpacing: 0
        ),
        primarySwatch: Colors.purple,
      ),
      home: SplashScreen(),
    );
  }
}
