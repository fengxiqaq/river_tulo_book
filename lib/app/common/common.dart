import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController buildSnackbar(String title,String context,SnackPosition position,EdgeInsets margin) {
  return Get.snackbar(title, context,snackPosition: position,margin: margin);
}