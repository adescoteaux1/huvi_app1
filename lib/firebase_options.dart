// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAC6mbarxqH7ZX8pFIu02XEDZJxKwtXAXs',
    appId: '1:625268055992:web:05c23906b98650a179794d',
    messagingSenderId: '625268055992',
    projectId: 'huvi-3b762',
    authDomain: 'huvi-3b762.firebaseapp.com',
    storageBucket: 'huvi-3b762.appspot.com',
    measurementId: 'G-FHKJ025RRQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAOIVfCmXqF4PB-2IrxBXKJq__sSwi-VCE',
    appId: '1:625268055992:android:110e9772a06d6ddf79794d',
    messagingSenderId: '625268055992',
    projectId: 'huvi-3b762',
    storageBucket: 'huvi-3b762.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDYLQWF4lQuKJ23odeHPT0YYnaSF3g4C7A',
    appId: '1:625268055992:ios:8fd2dcbc1cf19a1b79794d',
    messagingSenderId: '625268055992',
    projectId: 'huvi-3b762',
    storageBucket: 'huvi-3b762.appspot.com',
    iosBundleId: 'com.example.huviApp1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDYLQWF4lQuKJ23odeHPT0YYnaSF3g4C7A',
    appId: '1:625268055992:ios:5410256b419029c279794d',
    messagingSenderId: '625268055992',
    projectId: 'huvi-3b762',
    storageBucket: 'huvi-3b762.appspot.com',
    iosBundleId: 'com.example.huviApp1.RunnerTests',
  );
}
