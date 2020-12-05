import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackitallproj/utils/firebase_utils.dart';

import '../app_theme.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<Notification> lst = new List<Notification>();
  FirebaseUtils firebaseUtils = new FirebaseUtils();

  void getNotifications() async {
    await firebaseUtils.getNotifications().then((mp) {
      print(mp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightColor,
      body: Padding(
        padding: EdgeInsets.only(left: 8.0, top: 30.0, right: 8.0),
        child: Column(

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
