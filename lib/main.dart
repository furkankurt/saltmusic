import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:salt_music/app/common/resource/theme.dart';
import 'package:salt_music/app/common/resource/translations.dart';
import 'package:salt_music/app/routes/app_pages.dart';
import 'package:salt_music/app/routes/binding.dart';

Future<void> main() async {
  final binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);
  await AppBinding().dependencies();

  runApp(
    GetMaterialApp(
      title: 'Salt Music',
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en'),
      translations: Translation(),
      theme: lightTheme,
      darkTheme: darkTheme,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      initialBinding: AppBinding(),
    ),
  );
}
