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
  String firstName = "";
  String lastName = "";
  String department = "";
  String initial = "";
  ButtonState stateTextWithIcon = ButtonState.idle;
  String dropdownValue = "--";
  List<DropdownMenuItem<String>> dropdownItems = <String>['--']
      .map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();

  void getData() async {
    await firebaseUtils.getDepartments().then((mp) {
      List<String> lst = new List<String>();
      lst.add("--");
      mp.forEach((el) {
        lst.add(el['name']);
      });

      dropdownValue = "--";
      dropdownItems = lst.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(fontSize: 20),
          ),
        );
      }).toList();
    });

    await firebaseUtils.getUserInfo().then((mp) {
      setState(() {
        firstName = mp['first_name'];
        lastName = mp['last_name'];
        dropdownValue = mp['department'];
        initial = firstName[0];
      });
    });
  }

  void getDepartments() async {
    await firebaseUtils.getDepartments().then((mp) {
      List<String> lst = new List<String>();
      lst.add("--");
      mp.forEach((el) {
        lst.add(el['name']);
      });

      dropdownValue = "--";
      dropdownItems = lst.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(fontSize: 20),
          ),
        );
      }).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    firebaseUtils = new FirebaseUtils();
    // getDepartments();
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
                padding: EdgeInsets.only(top: 48, left: 16, right: 16),
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.deepPurple.shade500,
                    radius: 50,
                    child: Text(
                      initial,
                      style: TextStyle(fontSize: 48, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 24, left: 8, right: 8),
                child: TextFormField(
                  key: Key(firstName),
                  initialValue: firstName,
                  onChanged: (val) {
                    firstName = val;
                  },
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  decoration: InputDecoration(
                    labelText: "First Name",
                    fillColor: Colors.black,
                    contentPadding:
                        EdgeInsets.only(top: 16, left: 8, right: 8, bottom: 8),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 16, left: 8, right: 8),
                child: TextFormField(
                  key: Key(lastName),
                  initialValue: lastName,
                  onChanged: (val) {
                    lastName = val;
                  },
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  decoration: InputDecoration(
                    labelText: "Last Name",
                    fillColor: Colors.black,
                    contentPadding:
                        EdgeInsets.only(top: 16, left: 8, right: 8, bottom: 8),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.only(top: 24, left: 8, right: 8),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.black),
                      underline: Container(
                        height: 2,
                        color: Colors.black,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: dropdownItems,
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 48, left: 64, right: 64),
                child: ProgressButton.icon(
                    iconedButtons: {
                      ButtonState.idle: IconedButton(
                          text: "Save",
                          icon: Icon(Icons.send, color: Colors.white),
                          color: Colors.deepPurple.shade500),
                      ButtonState.loading: IconedButton(
                          text: "Loading", color: Colors.deepPurple.shade700),
                      ButtonState.fail: IconedButton(
                          text: "Failed",
                          icon: Icon(Icons.cancel, color: Colors.white),
                          color: Colors.red.shade300),
                      ButtonState.success: IconedButton(
                          text: "Success",
                          icon: Icon(
                            Icons.check_circle,
                            color: Colors.white,
                          ),
                          color: Colors.green.shade400)
                    },
                    onPressed: () async {
                      setState(() {
                        stateTextWithIcon = ButtonState.loading;
                      });

                      await firebaseUtils
                          .updateProfile(firstName, lastName, dropdownValue)
                          .then((value) {
                        Future.delayed(Duration(seconds: 1), () {
                          setState(() {
                            stateTextWithIcon = ButtonState.success;
                          });
                        }).then((value) {
                          Future.delayed(Duration(seconds: 1), () {
                            setState(() {
                              stateTextWithIcon = ButtonState.idle;
                            });
                          });
                        });
                      });
                    },
                    state: stateTextWithIcon),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
