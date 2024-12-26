// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBs7rrCwlhudbwsiJwDdHzsYegYT__QUCI',
    appId: '1:696668937392:web:c24960e6089a76addfef75',
    messagingSenderId: '696668937392',
    projectId: 'neww-b204d',
    authDomain: 'neww-b204d.firebaseapp.com',
    storageBucket: 'neww-b204d.firebasestorage.app',
    measurementId: 'G-KBBEV8LS9E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC1lx6cJt1IRx2naQG8jnmhfwdfBEjnDPE',
    appId: '1:696668937392:android:c8f288a45fa2d912dfef75',
    messagingSenderId: '696668937392',
    projectId: 'neww-b204d',
    storageBucket: 'neww-b204d.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyALqnViwYcclvX0_o6TKK9i34dWUD3UAvA',
    appId: '1:696668937392:ios:6eb7cdfb0acd00c2dfef75',
    messagingSenderId: '696668937392',
    projectId: 'neww-b204d',
    storageBucket: 'neww-b204d.firebasestorage.app',
    iosBundleId: 'com.example.messangerme',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyALqnViwYcclvX0_o6TKK9i34dWUD3UAvA',
    appId: '1:696668937392:ios:6eb7cdfb0acd00c2dfef75',
    messagingSenderId: '696668937392',
    projectId: 'neww-b204d',
    storageBucket: 'neww-b204d.firebasestorage.app',
    iosBundleId: 'com.example.messangerme',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBs7rrCwlhudbwsiJwDdHzsYegYT__QUCI',
    appId: '1:696668937392:web:539174dfe9d485f2dfef75',
    messagingSenderId: '696668937392',
    projectId: 'neww-b204d',
    authDomain: 'neww-b204d.firebaseapp.com',
    storageBucket: 'neww-b204d.firebasestorage.app',
    measurementId: 'G-SE5N0E25DG',
  );
}