import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hackitallproj/app_theme.dart';
import 'package:hackitallproj/components/PersonCard.dart';
import 'package:hackitallproj/models/Person.dart';
import 'package:hackitallproj/utils/firebase_utils.dart';

import '../hotel_booking/hotel_app_theme.dart';

class SearchPerson extends StatefulWidget {
  @override
  _SearchPersonState createState() => _SearchPersonState();
}

class _SearchPersonState extends State<SearchPerson> {
  List<Person> persons = List<Person>();
  List<Person> filteredPersons = List<Person>();
  FirebaseUtils firebaseUtils = FirebaseUtils();

  void getUsers() async {
    await firebaseUtils.getPersons().then((lst) {
      setState(() {
        lst.forEach((element) {
          Person person = Person(
              firstName: element['first_name'],
              lastName: element['last_name'],
              department: element['department'],
              name: element['first_name'] + " " + element['last_name'],
              uid: element['uid']);

          persons.add(person);
        });
        filteredPersons = persons;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Invite people',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 8.0, top: 0.0, right: 8.0),
        child: Column(
          children: [
            getSearchBarUI(),
            // Row(
            //   children: [
            //     Expanded(
            //       child: TextField(
            //         onChanged: (value) {
            //           setState(() {
            //             if (value.length > 0) {
            //               filteredPersons = persons
            //                   .where((element) => (element.name
            //                       .toLowerCase()
            //                       .contains(value.toLowerCase())))
            //                   .toList();
            //             } else {
            //               filteredPersons = persons;
            //             }
            //           });
            //         },
            //         style: TextStyle(color: Colors.black),
            //         decoration: InputDecoration(
            //           hintText: "Find Persons",
            //           hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
            //           enabledBorder: InputBorder.none,
            //           focusedBorder: InputBorder.none,
            //         ),
            //       ),
            //     ),
            //     SvgPicture.asset("assets/icons/search.svg"),
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
              child: Divider(
                thickness: 1,
              ),
            ),
            SizedBox(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: filteredPersons.length,
                      itemBuilder: (context, index) =>
                          PersonCard(person: filteredPersons[index]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getSearchBarUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: HotelAppTheme.buildLightTheme().backgroundColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(38.0),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        offset: const Offset(0, 2),
                        blurRadius: 8.0),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 4, bottom: 4),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        if (value.length > 0) {
                          filteredPersons = persons
                              .where((element) => (element.name
                                  .toLowerCase()
                                  .contains(value.toLowerCase())))
                              .toList();
                        } else {
                          filteredPersons = persons;
                        }
                      });
                    },
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                    cursorColor: HotelAppTheme.buildLightTheme().primaryColor,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: HotelAppTheme.buildLightTheme().primaryColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(38.0),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    offset: const Offset(0, 2),
                    blurRadius: 8.0),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(32.0),
                ),
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(FontAwesomeIcons.search,
                      size: 20,
                      color: HotelAppTheme.buildLightTheme().backgroundColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
