

import 'package:flutter/material.dart';
import 'package:new_proj/clock_round.dart';
import 'package:intl/intl.dart';


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
              children: <Widget>[
                buildMenu("Clock",0XFFC279FB),
                buildMenu("Alarm",0xFF748EF6),
                buildMenu("StopWatch",0xFFFFD54F),
                buildMenu("Timer",0xFFEAECFF),
              ],
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
  Padding buildMenu(String title,int x){
    return Padding(
      padding: const EdgeInsets.all(0),
      child: FlatButton(onPressed: (){},
          child:
             Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*.06,),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Color(x),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*.06,)
              ],
          )
      ),
    );
  }
}
