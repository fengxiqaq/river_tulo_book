import 'dart:io';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:river_tulo_book/app/data/app_color.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.transparent, // 透明状态栏
    systemNavigationBarColor: Colors.white70,
    statusBarBrightness: Brightness.light,
    systemNavigationBarDividerColor: Colors.black12,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent,systemNavigationBarColor: Colors.black12,statusBarBrightness: Brightness.light));
  runApp(
    ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: '河图洛书',
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.colorPrimary),
            fontFamily: 'font',
            navigationBarTheme: const NavigationBarThemeData(labelTextStyle: MaterialStatePropertyAll(TextStyle(color: AppColors.colorPrimary))),
            useMaterial3: true,
            scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor
          ),
        );
      },
    ),
  );
  if(Platform.isWindows || Platform.isMacOS || Platform.isLinux){
    doWhenWindowReady(() {
      final win = appWindow;
      const initialSize = Size(450, 1000);
      win.minSize = initialSize;
      win.size = initialSize;
      win.alignment = Alignment.center;
      win.maxSize = initialSize;
      win.title = "river_tulo_book";
      win.show();
    });
  }
}
