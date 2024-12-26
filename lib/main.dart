import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:messangerme/firebase_options.dart';
import 'package:messangerme/views/welcome_view.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const WelcomeView(),
    );
  }
}