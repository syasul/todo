import 'package:flutter/material.dart';
import 'package:todo_list/widget/updatepop.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final String value;
  final String uid;
  final Function onUpdate;
  final Function onDelete;

  ItemCard(
    this.title,
    this.value,
    this.uid, {
    this.onUpdate,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.20,
      secondaryActions: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Container(
            margin: EdgeInsets.only(right: 0, left: 0),
            width: 40,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.delete_outline_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                if (onDelete != null) onDelete();
              },
            ),
          ),
        ),
      ],
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return UpPop(
                    title: title,
                    value: value,
                    uid: uid,
                  );
                });
          },
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xFFFFF1F1),
                boxShadow: [
                  BoxShadow(blurRadius: 5.0, color: Colors.grey[300]),
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: Colors.grey[900], fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.87,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
