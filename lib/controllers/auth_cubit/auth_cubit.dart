import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:messangerme/core/repositries/repositry.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? messagetext;
  final Repositry repositry;

  AuthCubit(this.repositry) : super(AuthInitial());

  Future<void> signup() async {
     if (formKey.currentState?.validate() ?? false) {
    emit(AuthLoading());
    try {
     final  user = await repositry.signupfunction(emailController.text, passwordController.text);
  //   final User? user = await repositry.getuser();
    //  debugPrint('User email after signup: $userEmail'); // طباعة البريد الإلكتروني
      emit(AuthSuccess(user: user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
     }
  }

  

  Future<void> signin() async {
      if (formKey.currentState?.validate() ?? false) {
    emit(AuthLoading());
    try {
     final user = await repositry.signinfunction(emailController.text, passwordController.text);
     // final User? user = await repositry.getuser();
     // userEmail = user!.email; // تعيين البريد الإلكتروني بعد تسجيل الدخول
   // debugPrint('User email after signin: $userEmail'); // طباعة البريد الإلكتروني
      emit(AuthSuccess(user: user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
      }
  }


  void loadCurrentUser() {
    final user = repositry.getuser();
    emit(AuthSuccess(user: user));
  }
  Future<void> signout() async {
    emit(AuthLoading());
    try {
      await repositry.signoutfunction();
     // userEmail = null; // إعادة تعيين البريد الإلكتروني بعد تسجيل الخروج
      debugPrint('User signed out successfully.');
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }



  Stream<QuerySnapshot> getmessages() {
    return repositry.getmessages();
  }

 Future<void> sendmessage(String message, String? sender) async {
  if (sender == null || sender.isEmpty) {
    throw Exception('Sender email is null or empty');
  }
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  await firestore.collection('messages').add({
    'sender': sender,
    'text': message,
    'time': FieldValue.serverTimestamp(),  // إضافة الوقت هنا
  });
  debugPrint('Message sent successfully by: $sender');
}

}
