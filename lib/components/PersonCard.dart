import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackitallproj/models/Person.dart';
import 'package:hackitallproj/utils/firebase_utils.dart';

import '../app_theme.dart';

class PersonCard extends StatefulWidget {
  Person person;

  PersonCard({this.person});

  @override
  _PersonCardState createState() => _PersonCardState();
}

class _PersonCardState extends State<PersonCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.person.name,
                      style: eTitle,
                    ),
                  ],
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    onPressed: () async {
                      await FirebaseUtils().getUserInfo().then((mp) async {
                        await FirebaseUtils().addNotification(mp['first_name'] + " " + mp['last_name'], widget.person.uid);
                      });
                    },
                    icon: Icon(Icons.add, color: Colors.black,),
                  ),
                ],
              ),
          ],
        ),
        ],
      ),
    );
  }
}
