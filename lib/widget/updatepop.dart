import 'package:flutter/material.dart';
import 'package:todo_list/widget/upbodypop.dart';

class UpPop extends StatefulWidget {
  String title;
  String value;
  final String uid;

  UpPop({
    this.uid,
    this.title,
    this.value,
  });

  @override
  _UpPopState createState() => _UpPopState();
}

class _UpPopState extends State<UpPop> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.grey[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: 232,
        child: Column(
          children: [
            Container(
              height: 20,
              margin: EdgeInsets.only(top: 11, left: 9, right: 165, bottom: 11),
              color: Colors.transparent,
              child: Text(
                "Update Note",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            UpBody(
              title: widget.title,
              value: widget.value,
              uid: widget.uid,
            ),
          ],
        ),
      ),
    );
  }
}
