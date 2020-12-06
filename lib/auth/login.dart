import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hackitallproj/components/input_text_field.dart';
import 'package:hackitallproj/hotel_booking/hotel_app_theme.dart';
import 'package:hackitallproj/utils/firebase_utils.dart';

import '../app_theme.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FirebaseUtils _auth;

  String password;
  String email;
  String error = '';
  String errorFirstText;
  String errorSecondText;
  bool _loading;

  void initFirebase() async {
    await Firebase.initializeApp().then((value) {
      _auth = new FirebaseUtils();
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
          errorFirstText = 'Enter your email address!';
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
          errorSecondText = 'Enter your password!';
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
              AlwaysStoppedAnimation<Color>(HotelAppTheme.buildLightTheme().primaryColor),
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
          color: HotelAppTheme.buildLightTheme().primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Text(
            'Next',
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
                      '/search_persons', (route) => false);
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
                        child: Text('Log in', style: eTitle),
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
                            label: 'Password',
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
