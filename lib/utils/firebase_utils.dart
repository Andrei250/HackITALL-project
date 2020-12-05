
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUtils {
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseFirestore _db = FirebaseFirestore.instance;

    Future login(String email, String password) async {
      Map<String, String> mp = new Map<String, String>();

      try {
          UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
          mp['success'] = 'Success';
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          mp['error'] = 'No user found for that email.';
        } else if (e.code == 'wrong-password') {
          mp['error'] = 'Wrong password provided for that user.';
        }
      }

      return mp;
    }

    Future logout() async {
      return await _auth.signOut();
    }

    Future getUserInfo() async {
      String uid = _auth.currentUser.uid;
      var mp = await _db.collection('users').doc(uid).get();
      Map<String, dynamic> ans = new Map<String, dynamic>();

      mp.data().forEach((key, value) {ans[key] = value;});

      if (!ans.containsKey('department')) {
        ans['department'] = "--";
      }

      return ans;
    }

    Future updateProfile(String firstName, String lastName, String department) async {
      String uid = await _auth.currentUser.uid;
      Map<String, dynamic> mp = new Map<String, dynamic>();
      mp['first_name'] = firstName;
      mp['last_name'] = lastName;

      if (department != "--") {
        mp['department'] = department;
      }

      if (uid != null) {
        try {
          return await _db.collection('users').doc(uid).set(mp);
        } on FirebaseException catch (e) {
          print(e.stackTrace);
        }
      }
    }

    Future getDepartments() async {
      var snapshot = await _db.collection("departments").get();

      return snapshot.docs.map((doc) => doc.data()).toList();
    }

    Future getPersons() async {
      var snapshot = await _db.collection("users").get();

      return snapshot.docs.map((doc) {
        Map<String, dynamic> mp = new Map<String, dynamic>();
        doc.data().forEach((key, value) {
          mp[key] = value;
        });

        mp['uid'] = doc.id;
        return mp;
      }).toList();
    }
}