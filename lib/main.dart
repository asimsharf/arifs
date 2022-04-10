import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/modules/login/controllers/login_controller.dart';
import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  final LoginController cAuth = Get.put(LoginController());

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      /// status bar color
      statusBarColor: Colors.black,

      /// navigation bar color
      systemNavigationBarColor: Color(0xFFFFFFFF),

      /// color of navigation controls
      systemNavigationBarIconBrightness: Brightness.light,

      /// status bar icon color
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: cAuth.isAuth() ? AppPages.INITIAL : AppPages.LOGIN,
      getPages: AppPages.routes,
      builder: EasyLoading.init(),
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Changa Regular',
        backgroundColor: const Color(0xFF03A4ED),
        primaryColor: const Color(0xFF03A4ED),
        brightness: Brightness.light,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFF03A4ED),
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F8FA),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          color: Colors.black,
          elevation: 0.1,
          titleTextStyle: TextStyle(
            fontFamily: 'Changa Regular',
            color: Colors.white,
            // fontSize: 15,
            fontWeight: FontWeight.w800,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF03A4ED),
        ),
      ),
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: const Locale("ar", "SA"),
      supportedLocales: const [
        Locale("ar", "SA"),
      ],
    ),
  );
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.ripple
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 70.0
    ..radius = 10.0
    ..progressColor = const Color(0xFF03A4ED)
    ..backgroundColor = const Color(0xFFF7F8FA)
    ..indicatorColor = const Color(0xFF03A4ED)
    ..textColor = const Color(0xFF03A4ED)
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false;
}
