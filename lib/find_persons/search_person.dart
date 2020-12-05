import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackitallproj/app_theme.dart';
import 'package:hackitallproj/components/PersonCard.dart';
import 'package:hackitallproj/models/Person.dart';
import 'package:hackitallproj/utils/firebase_utils.dart';

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
          Person person = Person(firstName : element['first_name'],
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
      body: Padding(
        padding: EdgeInsets.only(left: 8.0, top: 30.0, right: 8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        if (value.length > 0) {
                          filteredPersons = persons.where((element) =>
                          (element.name.toLowerCase().contains(value.toLowerCase()))
                          ).toList();
                        } else {
                          filteredPersons = persons;
                        }

                      });
                    },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Find Persons",
                      hintStyle: TextStyle(
                          color: Colors.grey.withOpacity(0.5)
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                SvgPicture.asset("assets/icons/search.svg"),
              ],
            ),

            Divider(
              thickness: 2,
            ),
            SizedBox(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: filteredPersons.length,
                    itemBuilder: (context, index) =>  PersonCard(person: filteredPersons[index]),
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
