import 'package:flutter/material.dart';
import 'package:new_proj/Data/enums.dart';
import 'package:new_proj/Data/menuInfo.dart';
import 'package:provider/provider.dart';
import 'Views/homepage.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF2D2F41)
      ),
      home: ChangeNotifierProvider<MenuInfo>(
          create: (context)=>MenuInfo(MenuType.clock),
          child: HomePage()),
    );
  }
}
