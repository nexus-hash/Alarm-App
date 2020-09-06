import 'package:flutter/material.dart';

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
                children: alarms.map((alarm) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors:
                      [Colors.purple,Colors.red[300]],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          offset: Offset(4.0, 4.0),
                          color: Colors.red[400].withOpacity(0.1),
                          blurRadius: 4,
                          spreadRadius: 6
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
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
