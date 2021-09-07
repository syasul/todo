import 'package:flutter/material.dart';
import 'package:todo_list/widget/body.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0CECDD),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: 600,
            height: 800,
            child: Image.asset(
              'assets/office.png',
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            child: Text(
              "Todo.",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            top: 40,
            left: 20,
          ),
          Body()
        ],
      ),
    );
  }
}
