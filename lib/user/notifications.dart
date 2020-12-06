import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackitallproj/components/NotificationCard.dart';
import 'package:hackitallproj/models/notification.dart';
import 'package:hackitallproj/utils/firebase_utils.dart';

import '../app_theme.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<NotificationModel> lst = new List<NotificationModel>();
  FirebaseUtils firebaseUtils = new FirebaseUtils();

  void getNotifications() async {
    await firebaseUtils.getNotifications().then((mp) {
      setState(() {
        mp.forEach((el) {
          NotificationModel notification = new NotificationModel(text: el['text'], sender: el['sender'], route: el['route']);
          lst.add(notification);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightColor,
      body: Padding(
        padding: EdgeInsets.only(left: 8.0, top: 50.0, right: 8.0),
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: lst.length,
              itemBuilder: (context, index) =>  NotificationCard(not: lst[index]),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getNotifications();
  }
}
