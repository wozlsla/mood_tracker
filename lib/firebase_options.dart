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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDboQM84LOJ-fieNQ7qQ1OdF89deJpuxTU',
    appId: '1:77372018224:web:eab438a4ba09024025e7f5',
    messagingSenderId: '77372018224',
    projectId: 'mood-tracker-25',
    authDomain: 'mood-tracker-25.firebaseapp.com',
    storageBucket: 'mood-tracker-25.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAbLfHdPF5SSdOkX7LPFrEJrCGm_NliAak',
    appId: '1:77372018224:android:e69e1210133d052925e7f5',
    messagingSenderId: '77372018224',
    projectId: 'mood-tracker-25',
    storageBucket: 'mood-tracker-25.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCMGTeHuS_4OxzENdhoMFDIWjFj4uPVkGM',
    appId: '1:77372018224:ios:49fb26cb296d5e5d25e7f5',
    messagingSenderId: '77372018224',
    projectId: 'mood-tracker-25',
    storageBucket: 'mood-tracker-25.firebasestorage.app',
    iosBundleId: 'com.example.moodTracker',
  );

}