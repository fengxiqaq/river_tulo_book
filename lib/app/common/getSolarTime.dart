import 'package:dio/dio.dart';
import 'package:html/parser.dart';
import 'package:xpath_selector_html_parser/src/ext.dart';

class SolarTime{

  static getSolarTime(data) async {
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
    try {
      // longitude=118.8059&latitude=32.0563
      Response response = await Dio().get("https://fate.windada.com/cgi-bin/timezone", queryParameters: data);
      return response.data[0]["timeZoneId"];
    } catch (e) {
      return null;
    }
  }

}