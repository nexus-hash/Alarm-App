import 'package:flutter/material.dart';
import 'package:new_proj/clock_round.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFF2D2F41),
      body: Container(

        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Text("Clock",
            style: TextStyle(color: Colors.white,fontSize: 24),),
            RoundClock(),
          ],
        ),
      ),
    );
  }
}
