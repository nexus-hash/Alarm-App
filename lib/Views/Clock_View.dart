import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'clock_round.dart';


class ClockView extends StatefulWidget {
  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {



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

    return Container(
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
    );
  }
}
