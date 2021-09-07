import 'package:flutter/material.dart';
import 'package:todo_list/widget/bodypopup.dart';

class PopUp extends StatelessWidget {
  const PopUp({Key key}) : super(key: key);

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
                "Create Note",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            BodyPopup(),
          ],
        ),
      ),
    );
  }
}
