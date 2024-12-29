import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Repositry {
  final FirebaseAuth _firebaseAuth;

  Repositry(this._firebaseAuth);
  Future<User?> signupfunction(String emailAddress, String password) async {
    try {
      UserCredential userCredential =  await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<User?> signinfunction(String email, String password) async {
  try {
    // التحقق من صحة بيانات تسجيل الدخول
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    // التحقق من أن المستخدم موجود في Firebase
    if (userCredential.user != null) {
      return userCredential.user;
    } else {
      throw Exception('User not found.');
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      throw Exception('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      throw Exception('Wrong password provided for that user.');
    }
  } catch (e) {
    throw Exception(e.toString());
  }
  return null;
}


  Future<void> signoutfunction() async {
    await _firebaseAuth.signOut();
    debugPrint('User signed out successfully.');
  }

   User? getuser() {
    return _firebaseAuth.currentUser;
  }

  Stream<QuerySnapshot> getmessages() {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  return firestore
      .collection('messages')
      .orderBy('time', descending: true) // ترتيب تنازلي (الأحدث أولاً)
      .snapshots();
}


  Future<void> sendmessage(String message, String sender) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  await firestore.collection('messages').add({
    'text': message,
    'sender': sender,
    'time': FieldValue.serverTimestamp(), // تخزين الوقت
  });
  debugPrint('Message sent successfully: $message');
}

}
