import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lat_lng_to_timezone/lat_lng_to_timezone.dart' as tzmap;
import 'package:river_tulo_book/app/common/database.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final database = AppDatabase();

  // await database.into(database.todoItems).insert(TodoItemsCompanion.insert(
  //   title: 'todo: finish drift setup',
  //   content: 'We can now write queries and define our own tables.',
  // ));
  // List<TodoItem> allItems = await database.select(database.todoItems).get();
  //
  // print('items in database: $allItems');


  // final dateTime = DateTime(2023,11,27,9,24);
  // int year = dateTime.year; // 指定年份
  // int month = 11; // 指定月份
  // int day = 29; // 指定日期
  //
  // int dayOfYear = dateTime.difference(DateTime(dateTime.year,1, 1)).inDays + 1;
  //
  // double N0 = 79.6764 + 0.2422 * (year - 1985) - ((0.25 * (year - 1985)).toInt());
  // double theta = 2 * pi * (dayOfYear - N0) / 365.2422;
  //
  // double deltaT = 0.0028 - 1.9857 * sin(theta) + 9.9059 * sin(theta * 2) - 7.0924 * cos(theta) - 0.6882 * cos(theta * 2);
  //
  // print('Δt = $deltaT');
  //
  // var ping = (-36 - 120) * 4;
  //
  // var zheng = dateTime.add(Duration(seconds: (ping * 60).toInt() + (deltaT * 60).toInt()));
  //
  // print(zheng.toString());
  //
  // double latitude = 32;
  // double longitude = 119;
  //
  // String tz = tzmap.latLngToTimezoneString(latitude, longitude);
  // print('Montreal is in the $tz time zone.');

/*  print();*/

}
