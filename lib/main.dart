import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:messangerme/core/di/getit.dart';
import 'package:messangerme/core/routing/app_routes.dart';
import 'package:messangerme/core/routing/routes.dart';
import 'package:messangerme/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
initDependencies();
  runApp( MyApp(appRoutes: AppRoutes(),));
}

class MyApp extends StatelessWidget {
   final  _firebaseAuth = FirebaseAuth.instance;
  final AppRoutes appRoutes;
   MyApp({super.key, required this.appRoutes});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
          initialRoute: _firebaseAuth.currentUser == null ? Routes.home : Routes.chat,
          onGenerateRoute: AppRoutes().generateRoute,
    );
  }
}