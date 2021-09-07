import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BodyPopup extends StatelessWidget {
  var titleController = TextEditingController();
  var valueController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    return Container(
      height: 190,
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.only(
            bottomLeft: const Radius.circular(20),
            bottomRight: const Radius.circular(20)),
      ),
      child: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                    hintText: 'Title', border: InputBorder.none),
                autofocus: true,
              ),
              TextFormField(
                controller: valueController,
                decoration: InputDecoration(
                    hintText: 'Value', border: InputBorder.none),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                  left: 21,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 25),
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.grey,
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: const Text('cancel'),
                      ),
                    ),
                    Container(
                      height: 43.0,
                      width: 140,
                      child: Material(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Color(0xFF0CECDD),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFF0CECDD),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(40.0))),
                          onPressed: () {
                            users.add({
                              'title': titleController.text,
                              'value': valueController.text,
                            });
                            Navigator.of(context).pop();
                            titleController.text = '';
                            valueController.text = '';
                          },
                          child: Center(
                            child: Text(
                              'Create',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
