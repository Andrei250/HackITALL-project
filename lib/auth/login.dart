import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hackitallproj/components/input_text_field.dart';
import 'package:hackitallproj/utils/PushNotificationService.dart';
import 'package:hackitallproj/utils/firebase_utils.dart';

import '../app_theme.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FirebaseUtils _auth;
  final pushNotificationService = PushNotificationsManager();

  String password;
  String email;
  String error = '';
  String errorFirstText;
  String errorSecondText;
  bool _loading;

  void initFirebase() async {
    await Firebase.initializeApp().then((value) {
      _auth = new FirebaseUtils();
      pushNotificationService.init();
    });
  }

  @override
  void initState() {
    super.initState();
    _loading = false;
    initFirebase();
  }

  ScrollController _scrollController = ScrollController();

  _scrollToBottom() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  @override
  Widget build(BuildContext context) {
    bool passwordOk = false;
    bool emailOk = false;
    bool valid = false;

    void changePassword(String val) {
      password = val;
    }

    void changeEmail(String val) {
      email = val;
    }

    void verifyEmail() {
      if (email == null) {
        setState(() {
          errorFirstText = 'Introduceti adresa de email!';
        });
      } else {
        setState(() {
          emailOk = true;
        });
      }
    }

    void verifyPassword() {
      if (password == null) {
        setState(() {
          errorSecondText = 'Introduceti parola!';
        });
      } else {
        setState(() {
          passwordOk = true;
        });
      }
    }

    void verifyBoth() {
      verifyEmail();
      verifyPassword();
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: _loading
              ? PreferredSize(
            preferredSize: Size(double.infinity, 1.0),
            child: LinearProgressIndicator(
              valueColor:
              AlwaysStoppedAnimation<Color>(AppTheme.lightAccent),
            ),
          )
              : null,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () {},
          ),
        ),
        floatingActionButton: new RaisedButton(
          color: AppTheme.lightAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Text(
            'Inainte',
            style: eButton,
          ),
          onPressed: () async {
            setState(() {
              verifyBoth();
              if (passwordOk == true && emailOk == true) {
                valid = true;
              }
            });
            if (valid == true) {
              setState(() {
                _loading = true;
              });
              dynamic result = await _auth.login(email, password);
              setState(() {
                _loading = false;
              });

              if (result == null) {
                setState(() {
                  errorFirstText = 'Incorrect credentials';
                  errorSecondText = 'Incorrect credentials';
                });
              } else {
                if (result['error'] != null) {
                  setState(() {
                    errorFirstText = result['error'];
                    errorSecondText = '';
                  });
                } else {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/home_page', (route) => false);
                }
              }
            }
          },
        ),
        body: ListView(
            shrinkWrap: true,
            controller: _scrollController,
            reverse: true,
            children: <Widget>[
              Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 10.0),
                  child: Column(
                    children: <Widget>[
                      // LogoRegister(),
                      SizedBox(
                        height: 30.0,
                      ),
                      SizedBox(
                        child: Text('Intra in cont', style: eTitle),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        width: 320.0,
                        height: 105.0,
                        child: InputTextField(
                          label: 'Email',
                          passwordText: false,
                          inputType: TextInputType.text,
                          changeValue: changeEmail,
                          errorText: errorFirstText,
                          one: true,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                          width: 320.0,
                          height: 88.0,
                          child: InputTextField(
                            label: 'Parola',
                            passwordText: true,
                            inputType: TextInputType.text,
                            changeValue: changePassword,
                            errorText: errorSecondText,
                            one: false,
                          )),
                      SizedBox(
                        height: 80.0,
                      ),
                    ],
                  ),
                ),
              ]),
            ]));
  }
}
