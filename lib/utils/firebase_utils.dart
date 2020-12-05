
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
}