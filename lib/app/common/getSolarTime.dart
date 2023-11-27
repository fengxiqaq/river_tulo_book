
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:html/parser.dart';
import 'package:xpath_selector_html_parser/src/ext.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:lat_lng_to_timezone/lat_lng_to_timezone.dart' as tzmap;

class SolarTime{

  static DateTime getSolarTime(DateTime dateTime,double longitude,double latitude) {
    // final dateTime = DateTime(2005,10,28,21,5);
    int year = dateTime.year; // 指定年份
    // int month = 11; // 指定月份
    // int day = 29; // 指定日期
    int dayOfYear = dateTime.difference(DateTime(dateTime.year,1, 1)).inDays + 1;
    double N0 = 79.6764 + 0.2422 * (year - 1985) - ((0.25 * (year - 1985)).toInt());
    double theta = 2 * pi * (dayOfYear - N0) / 365.2422;
    double deltaT = 0.0028 - 1.9857 * sin(theta) + 9.9059 * sin(theta * 2) - 7.0924 * cos(theta) - 0.6882 * cos(theta * 2);
    // var timeZone = await SolarTime.getTimeZone({"longitude":longitude,"latitude":latitude});
    var timezone = caculateTimeZone(longitude);
    var shiQu = 120;
    if(timezone == "+0"){
      shiQu = 0;
    }
    else if(timezone == "+1"){
      shiQu = 15;
    }
    else if(timezone == "+2"){
      shiQu = 30;
    }
    else if(timezone == "+3"){
      shiQu = 45;
    }
    else if(timezone == "+4"){
      shiQu = 60;
    }
    else if(timezone == "+5"){
      shiQu = 75;
    }
    else if(timezone == "+6"){
      shiQu = 90;
    }
    else if(timezone == "+7"){
      shiQu = 105;
    }
    else if(timezone == "+8"){
      shiQu = 120;
    }
    else if(timezone == "+9"){
      shiQu = 135;
    }
    else if(timezone == "+10"){
      shiQu = 150;
    }
    else if(timezone == "+11"){
      shiQu = 165;
    }
    else if(timezone == "+12"){
      shiQu = 180;
    }
    else if(timezone == "-12"){
      shiQu = 180;
    }
    else if(timezone == "-11"){
      shiQu = -165;
    }
    else if(timezone == "-10"){
      shiQu = -150;
    }
    else if(timezone == "-9"){
      shiQu = -135;
    }
    else if(timezone == "-8"){
      shiQu = -120;
    }
    else if(timezone == "-7"){
      shiQu = -105;
    }
    else if(timezone == "-6"){
      shiQu = -90;
    }
    else if(timezone == "-5"){
      shiQu = -75;
    }
    else if(timezone == "-4"){
      shiQu = -60;
    }
    else if(timezone == "-3"){
      shiQu = -45;
    }
    else if(timezone == "-2"){
      shiQu = -30;
    }
    else if(timezone == "-1"){
      shiQu = -15;
    }
    print(shiQu);
    var ping = (longitude - shiQu) * 4;
    var zheng = dateTime.add(Duration(seconds: (ping * 60).toInt() + (deltaT * 60).toInt()));
    return zheng;
  }

  static String caculateTimeZone(double currentLon) {
    int timeZone;
    int shangValue = (currentLon ~/ 15).toInt();
    double yushuValue = (currentLon % 15).abs();
    if (yushuValue <= 7.5) {
      timeZone = shangValue;
    } else {
      timeZone = shangValue + (currentLon > 0 ? 1 : -1);
    }
    return timeZone >= 0 ? "+${timeZone.abs()}" : "-${timeZone.abs()}";
  }

  static getSolarTimeNet(data) async {
    try {
      Response response = await Dio().post("https://fate.windada.com/cgi-bin/SolarTime", data: data,options: Options(
          contentType : Headers.formUrlEncodedContentType,
          responseType: ResponseType.plain,
          followRedirects: true
      ));
      final document = parse(response.data.toString()).documentElement!;
      var queryXPath = document.queryXPath('//*[@id="Myarticle"]/form/center/table/tbody/tr[7]/td[2]/text()').attrs[0];
      return queryXPath;
    } catch (e) {
      return null;
    }
  }

  static getTimeZone(data) async {
    String tz = tzmap.latLngToTimezoneString(num.parse(data["latitude"]),num.parse(data["longitude"]));
    return tz;
  }

  static getTimeZoneNet(data) async {
    try {
      // longitude=118.8059&latitude=32.0563
      Response response = await Dio().get("https://fate.windada.com/cgi-bin/timezone", queryParameters: data);
      return response.data[0]["timeZoneId"];
    } catch (e) {
      return null;
    }
  }

}