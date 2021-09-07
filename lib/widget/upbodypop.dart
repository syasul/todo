import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpBody extends StatefulWidget {
  String title;
  String value;
  final Function onUpdate;
  final String uid;

  UpBody({
    this.title,
    this.value,
    this.onUpdate,
    this.uid,
  });

  @override
  _UpBodyState createState() => _UpBodyState();
}

class _UpBodyState extends State<UpBody> {
  TextEditingController title;
  TextEditingController value;

  void initState() {
    super.initState();
    title = new TextEditingController(text: widget.title);
    value = new TextEditingController(text: widget.value);
  }

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
                controller: title,
              ),
              TextFormField(
                controller: value,
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
                            FirebaseFirestore.instance
                                .collection('users')
                                .doc(widget.uid)
                                .update({
                              "title": title.text,
                              "value": value.text
                            }).then((result) {
                              print('success');
                            }).catchError((onError) {
                              print(widget.uid);
                            });
                            Navigator.of(context).pop();
                          },
                          child: Center(
                            child: Text(
                              'Update',
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
