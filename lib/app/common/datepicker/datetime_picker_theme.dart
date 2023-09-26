import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:river_tulo_book/app/data/app_color.dart';

class DatePickerTheme with DiagnosticableTreeMixin {
  final TextStyle cancelStyle;
  final TextStyle doneStyle;
  final TextStyle itemStyle;
  final Color backgroundColor;
  final Color? headerColor;

  final double containerHeight;
  final double titleHeight;
  final double itemHeight;

  const DatePickerTheme({
    this.cancelStyle = const TextStyle(color: Colors.black54, fontSize: 16),
    this.doneStyle = const TextStyle(color: AppColors.colorPrimary, fontSize: 16,fontFamily: "font"),
    this.itemStyle = const TextStyle(color: Color(0xFF000046), fontSize: 18),
    this.backgroundColor = Colors.white,
    this.headerColor,
    this.containerHeight = 210.0,
    this.titleHeight = 44.0,
    this.itemHeight = 36.0,
  });
}
