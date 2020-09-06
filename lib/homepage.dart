

import 'package:flutter/material.dart';
import 'package:new_proj/clock_round.dart';
import 'package:intl/intl.dart';
import 'package:new_proj/menuInfo.dart';
import 'package:provider/provider.dart';
import 'Data.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {


    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timeZoneString1 = now.timeZoneOffset.toString().split('.').first.split(':').first;
    var timeZoneString =  now.timeZoneOffset.toString().split('.').first.split(':')[1];

    var offsetSign = '';
    if(!timeZoneString.startsWith('-')){
      offsetSign = '+';
    }

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
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 32,vertical: 64),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Text("Clock",
                      style: TextStyle(color: Colors.white,fontSize: 22),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(formattedTime,
                            style: TextStyle(color: Colors.white,fontSize: 54),
                          ),
                          Text(formattedDate,
                            style: TextStyle(color: Colors.white,fontSize: 18),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*.025,
                    ),
                    Flexible(
                      flex: 5,
                        fit: FlexFit.tight,
                        child: Align(
                            alignment: Alignment.center,
                            child: RoundClock(size: 220.0,))),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Timezone",
                            style: TextStyle(color: Colors.white,fontSize: 18),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*.015,),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.language,color: Colors.white,size: 17,

                              ),
                              SizedBox(width: MediaQuery.of(context).size.width*.05,),
                              Text("UTC"+offsetSign+timeZoneString1+":"+timeZoneString,
                                style: TextStyle(color: Colors.white,fontSize: 17),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),

                  ],
                ),
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
