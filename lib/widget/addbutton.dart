import 'package:flutter/material.dart';
import 'package:todo_list/widget/popup.dart';

class Button extends StatelessWidget {
  const Button({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return PopUp();
              });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color(0xFFFFF338),
      ),
      top: -30,
      right: 30,
    );
  }
}
