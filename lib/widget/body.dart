import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/widget/addbutton.dart';
import 'package:todo_list/widget/item_card.dart';

class Body extends StatelessWidget {
  final String title;
  final String value;

  const Body({Key key, this.title, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    return DraggableScrollableSheet(
      maxChildSize: 0.85,
      minChildSize: 0.1,
      initialChildSize: 0.1,
      builder: (BuildContext context, ScrollController scrolController) {
        return Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                  boxShadow: [
                    BoxShadow(blurRadius: 10.0, color: Colors.grey[400]),
                  ]),
              child: ListView(
                children: [
                  StreamBuilder<QuerySnapshot>(
                    stream:
                        users.orderBy('title', descending: true).snapshots(),
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        print(snapshot.data.docs[0].id);
                        return Column(
                          children: snapshot.data.docs
                              .map((e) => ItemCard(
                                    e['title'],
                                    e['value'],
                                    e.id,
                                    onUpdate: () {
                                      users.doc(e.id).update({
                                        'title': e['title'],
                                        'value': e['value'],
                                      });
                                    },
                                    onDelete: () {
                                      users.doc(e.id).delete();
                                    },
                                  ))
                              .toList(),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  )
                ],
                controller: scrolController,
              ),
            ),
            Button()
          ],
        );
      },
    );
  }
}
