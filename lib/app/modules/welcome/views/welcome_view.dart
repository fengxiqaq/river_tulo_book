import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Delay for 2 seconds before navigating
    Future.delayed(const Duration(seconds: 2), () {
      // Navigate to the home page
      Get.offNamed('/home'); // Change '/home' to your actual route
    });

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image(image: const AssetImage("images/app_icon.png"),width: 200.w),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsetsDirectional.all(50.w),
              child: Text("powered by @FengXi",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }
}
