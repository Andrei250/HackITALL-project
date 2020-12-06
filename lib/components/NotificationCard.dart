import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackitallproj/hotel_booking/model/hotel_list_data.dart';
import 'package:hackitallproj/models/Person.dart';
import 'package:hackitallproj/models/notification.dart';
import 'package:hackitallproj/utils/firebase_utils.dart';

import '../app_theme.dart';

class NotificationCard extends StatefulWidget {
  NotificationModel not;

  NotificationCard({this.not});

  @override
  _NotificationCardState createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Card(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text('Invitatie', style: TextStyle(color: Colors.black)),
                    subtitle: Text(
                      widget.not.text,
                      style: eTitle,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      FlatButton(
                        child: Text('Enter Meet', style: TextStyle(fontSize: 20.0),),
                        color: Colors.blueAccent,
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.pushNamed(context, widget.not.route, arguments: new HotelListData());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
