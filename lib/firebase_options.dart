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
    apiKey: 'AIzaSyCRs65KeyvuRQiES4TeQ64dTAv1XT71d6s',
    appId: '1:838899688555:web:44fac51ebbdf1b692ebd2e',
    messagingSenderId: '838899688555',
    projectId: 'closed-network-dev',
    authDomain: 'closed-network-dev.firebaseapp.com',
    storageBucket: 'closed-network-dev.appspot.com',
    measurementId: 'G-W6HSF3N5WD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBxSzWxI9wIurqJZaRJ8uRoVT4mjzeX8sg',
    appId: '1:838899688555:android:f93f56aa5823202c2ebd2e',
    messagingSenderId: '838899688555',
    projectId: 'closed-network-dev',
    storageBucket: 'closed-network-dev.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBZ3wEz6ViAp3qaNkmDwGLLRaaawqobGO0',
    appId: '1:838899688555:ios:66f3fce91eedddc72ebd2e',
    messagingSenderId: '838899688555',
    projectId: 'closed-network-dev',
    storageBucket: 'closed-network-dev.appspot.com',
    iosBundleId: 'com.example.notificationMobileClient',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBZ3wEz6ViAp3qaNkmDwGLLRaaawqobGO0',
    appId: '1:838899688555:ios:164167d1b48431972ebd2e',
    messagingSenderId: '838899688555',
    projectId: 'closed-network-dev',
    storageBucket: 'closed-network-dev.appspot.com',
    iosBundleId: 'com.example.notificationMobileClient.RunnerTests',
  );
}