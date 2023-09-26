import 'dart:io';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:river_tulo_book/app/data/app_color.dart';
import 'app/routes/app_pages.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent,systemNavigationBarColor: Colors.black12));
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
            colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(168, 81, 81, 1)),
            fontFamily: 'font',
            navigationBarTheme: const NavigationBarThemeData(labelTextStyle: MaterialStatePropertyAll(TextStyle(color: Color.fromRGBO(168, 81, 81, 1)))),
            useMaterial3: true,
          ),
        );
      },
    ),
  );
  if(Platform.isWindows || Platform.isIOS || Platform.isLinux){
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
