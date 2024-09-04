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
    apiKey: 'AIzaSyAPOOpuZ3MZh_QOWwyALrxpGdV10DIUY_E',
    appId: '1:610779326510:web:b005e397c9f5b7d951d7bf',
    messagingSenderId: '610779326510',
    projectId: 'alert-app-18c9f',
    authDomain: 'alert-app-18c9f.firebaseapp.com',
    storageBucket: 'alert-app-18c9f.appspot.com',
    measurementId: 'G-924FND1B4E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCURFadj_TJAKRn2g5rPFUdbRNu1r2Wj8U',
    appId: '1:610779326510:android:b3920aca19cfcc0851d7bf',
    messagingSenderId: '610779326510',
    projectId: 'alert-app-18c9f',
    storageBucket: 'alert-app-18c9f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDQO_PUXzWAJBXdFEHujX50UlyYbXJhpMg',
    appId: '1:610779326510:ios:d9e65a16020fc4b551d7bf',
    messagingSenderId: '610779326510',
    projectId: 'alert-app-18c9f',
    storageBucket: 'alert-app-18c9f.appspot.com',
    iosBundleId: 'com.example.alertApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDQO_PUXzWAJBXdFEHujX50UlyYbXJhpMg',
    appId: '1:610779326510:ios:d9e65a16020fc4b551d7bf',
    messagingSenderId: '610779326510',
    projectId: 'alert-app-18c9f',
    storageBucket: 'alert-app-18c9f.appspot.com',
    iosBundleId: 'com.example.alertApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAPOOpuZ3MZh_QOWwyALrxpGdV10DIUY_E',
    appId: '1:610779326510:web:990a6f353cdbc26251d7bf',
    messagingSenderId: '610779326510',
    projectId: 'alert-app-18c9f',
    authDomain: 'alert-app-18c9f.firebaseapp.com',
    storageBucket: 'alert-app-18c9f.appspot.com',
    measurementId: 'G-VM344Y0BZ0',
  );
}
