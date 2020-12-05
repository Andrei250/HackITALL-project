import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackitallproj/utils/firebase_utils.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';

import '../app_theme.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  FirebaseUtils firebaseUtils;
  String firstName;
  String lastName;

  void getData() async {
      await firebaseUtils.getUserInfo().then((mp) {
        setState(() {
          firstName = mp['first_name'];
          lastName = mp['last_name'];
        });
      });
  }

  @override
  void initState() {
    super.initState();
    firebaseUtils = new FirebaseUtils();
    firstName = "";
    lastName = "";
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: true,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: 48,
                    left: 16,
                    right: 16),
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.brown.shade800,
                    radius: 50,
                    child: Text('A', style: TextStyle(fontSize: 48,),),
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.only(
                    top: 48,
                    left: 64,
                    right: 64),
                child: TextFormField(
                  initialValue: firstName,
                  onChanged: (val) { firstName = val; },
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  decoration: InputDecoration(
                    labelText: "First Name",
                    fillColor: Colors.black,
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.only(
                    top: 48,
                    left: 64,
                    right: 64),
                child: TextFormField(
                  initialValue: lastName,
                  onChanged: (val) {lastName = val;},
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  decoration: InputDecoration(
                    labelText: "Last Name",
                    fillColor: Colors.black,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                    top: 48,
                    left: 64,
                    right: 64),
                child: ProgressButton.icon(iconedButtons: {
                  ButtonState.idle:
                  IconedButton(
                      text: "Save",
                      icon: Icon(Icons.send,color: Colors.white),
                      color: Colors.deepPurple.shade500),
                  ButtonState.loading:
                  IconedButton(
                      text: "Loading",
                      color: Colors.deepPurple.shade700),
                  ButtonState.fail:
                  IconedButton(
                      text: "Failed",
                      icon: Icon(Icons.cancel,color: Colors.white),
                      color: Colors.red.shade300),
                  ButtonState.success:
                  IconedButton(
                      text: "Success",
                      icon: Icon(Icons.check_circle,color: Colors.white,),
                      color: Colors.green.shade400)
                  },
                  onPressed: () async {
                      await firebaseUtils.updateProfile(firstName, lastName);
                  },
                  state: ButtonState.idle
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}