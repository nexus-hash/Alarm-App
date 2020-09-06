import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:new_proj/Static_Constaints.dart';

import '../Data/Data.dart';
class AlarmPage extends StatefulWidget {
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Alarm",
              style: TextStyle(color: Colors.white,fontSize: 22),
            ),
            Expanded(
              child: ListView(
                children: alarms.map<Widget>((alarm) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    padding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors:alarm.gradientColors,
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          offset: Offset(0.0, 4.0),
                          color: alarm.gradientColors.last.withOpacity(0.1),
                          blurRadius: 8,
                          spreadRadius: 2
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.label,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                SizedBox(width: 8,),
                                Text('Morning',
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                              ],
                            ),

                            Switch(value: true, onChanged:(bool value){},
                            activeColor: Colors.white,
                            ),
                          ],
                        ),
                        Text("Mon-Fri",
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "7:00 AM",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                              size: 36,
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }).followedBy([
                  DottedBorder(
                    strokeWidth: 2,
                    borderType: BorderType.RRect,
                    radius: Radius.circular(24),
                    color: CustomColors.outLine,
                    dashPattern: [5,4],
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: CustomColors.addAlarm,
                        borderRadius: BorderRadius.all(Radius.circular(24))
                      ),
                      child: FlatButton(
                        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 32),
                        onPressed: (){},
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.add_alarm,color: Color(0xFF5FC6FF),
                            size: 45,
                            ),
                            SizedBox(height: 8,),
                            Text("Add Alarm",
                              style: TextStyle(
                                color: Colors.white
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ]).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
