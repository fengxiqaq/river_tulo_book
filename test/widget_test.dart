import 'dart:math';

// void main(){
//
//   // getSolarTime();
//
//   final dateTime = DateTime(2006,8,28,21,5);
//   final longitude = 119.44; // 纽约市的经度
//
//   final trueSolarTime = calculateTrueSolarTime(dateTime, longitude);
//   print('True Solar Time: ${trueSolarTime ~/ 60}:${trueSolarTime % 60}');
//
// }

getSolarTime(){
  final latitude = 41.387048;
  final longitude = 2.17413425;

  // final instant = Instant(year: 2006, month: 8, day: 28, hour: 21,minute: 5,timeZoneOffset: 8.0);
  //
  // final calc = SolarCalculator(instant, latitude, longitude);

  // bool isHoursOfDarkness = calc.isHoursOfDarkness;
  // var dayOfYear = instant.dayOfYear;
  // var sun = calc.sunEquatorialPosition.rightAscension;

  // print(sun);

}

double calculateTrueSolarTime(DateTime dateTime, double longitude) {
  final julianDay = dateTime.difference(DateTime.utc(2000, 1, 1)).inDays +
      dateTime.hour / 24 +
      dateTime.minute / (24 * 60) +
      dateTime.second / (24 * 60 * 60);

  final t = (julianDay - 2451545) / 36525;
  final s = 280.46 + 36000.771 * t;

  final L = longitude * pi / 180;
  final G = 357.528 + 35999.050 * t - 0.014 * t * t;

  final equationOfTime = (1.915 * sin(G * pi / 180) + 0.02 * sin(2 * G * pi / 180)) -
      (2.466 * sin(2 * L - G * pi / 180) + 0.053 * sin(4 * L - G * pi / 180));

  final trueSolarTime = dateTime.hour * 60 +
      dateTime.minute +
      equationOfTime -
      4 * longitude +
      720;

  return trueSolarTime % 1440;
}

void main() {
  // 获取当前日期
  final dateTime = DateTime(2023,6,2,0,6);

  int dayOfYear = dateTime.difference(DateTime(dateTime.year,1, 1)).inDays + 1;

  // 计算时间差
  double equationOfTime = calculateEquationOfTime(dateTime.year,dayOfYear);

  // 输出结果
  print('Equation of Time: $equationOfTime minutes');
}

// 将角度转换为弧度
double radians(double degrees) {
  return degrees * pi / 180.0;
}

// 计算均时差
double calculateEquationOfTime(int year, int dayOfYear) {
  double y = year - 2000;
  double d = dayOfYear.toDouble();

  double equation = -7.659 * sin(6.24004077 + 0.01720197 * (365 * y + d)) +
      9.863 * sin(2 * (6.24004077 + 0.01720197 * (365 * y + d)) + 3.5932);

  return equation;
}