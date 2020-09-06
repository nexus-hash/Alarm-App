

import 'package:flutter/material.dart';
import 'package:new_proj/Views/Alarm_PageView.dart';
import 'package:new_proj/Views/Clock_View.dart';
import 'package:new_proj/Data/enums.dart';
import 'package:new_proj/Data/menuInfo.dart';
import 'package:provider/provider.dart';
import '../Data/Data.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {




    return Scaffold(
      backgroundColor:  Color(0xFF2D2F41),
      body: Row(
        children: <Widget>[
          Flexible(
            flex: -3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: menuItems.map((currentMenuInfo)=>buildMenu(currentMenuInfo)).toList()
            ),
          ),
          VerticalDivider(
            color: Colors.white54,width: 1,
          ),

            Expanded(
              child: Consumer<MenuInfo>(
                builder: (BuildContext context, MenuInfo value,Widget child){
                  if (value.menuType==MenuType.clock) {
                  return ClockView();}
                  else if(value.menuType==MenuType.alarm){
                    return AlarmPage();
                  }
                  return Container();
                },
              ),
            ),

        ],
      ),
    );
  }
  Widget buildMenu(MenuInfo currentMenuInfo){
    return
      Consumer<MenuInfo>(
        builder: (BuildContext context, MenuInfo value, Widget child){
          return FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(32))
            ),
            color: currentMenuInfo.menuType == value.menuType ?
                Color(0xFF2D2B33) :
                    Colors.transparent
            ,
            onPressed: (){
              var menuInfo = Provider.of<MenuInfo>(context,listen: false);
              menuInfo.updateMenu(currentMenuInfo);
            },
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*.06,),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    currentMenuInfo.title,
                    style: TextStyle(
                      color: Color(currentMenuInfo.x),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*.06,)
              ],
            ),
          );
        },
      );
  }
}
