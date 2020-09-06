import 'package:flutter/foundation.dart';
import 'package:new_proj/Data/enums.dart';

class MenuInfo extends ChangeNotifier{
  MenuType menuType;
  String title;
  int x;

  MenuInfo(this.menuType,{this.title,this.x});

  updateMenu(MenuInfo menuInfo){
    this.menuType=menuInfo.menuType;
    this.title=menuInfo.title;
    this.x=menuInfo.x;

    notifyListeners();
  }
}