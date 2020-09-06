import 'package:new_proj/Data/enums.dart';
import 'package:new_proj/Static_Constaints.dart';
import 'AlarmInfo.dart';

import 'menuInfo.dart';

List<MenuInfo> menuItems=[
  MenuInfo(MenuType.clock,
  title: 'Clock',x: 0XFFC279FB),
  MenuInfo(MenuType.alarm,
      title: 'Alarm',x: 0xFF748EF6),
  MenuInfo(MenuType.timer,
      title: 'Timer',x: 0xFFFFD54F),
  MenuInfo(MenuType.stopwatch,
      title: 'Stopwatch',x: 0xFFEAECFF),
];

List<AlarmInfo> alarms=[
  AlarmInfo(DateTime.now().add(Duration(minutes: 3)),description: 'refe',gradientColors: GradientColors.sky),
  AlarmInfo(DateTime.now().add(Duration(minutes: 3)),description: 'DoctorAp',gradientColors: GradientColors.sunset),
];