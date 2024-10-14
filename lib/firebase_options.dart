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
    apiKey: 'AIzaSyAXcVcMq8MMTp7T4yJqi7B_2zHx17dnuVA',
    appId: '1:974408287249:web:e097eb317901e26eea5db0',
    messagingSenderId: '974408287249',
    projectId: 'restaurante-fadab',
    authDomain: 'restaurante-fadab.firebaseapp.com',
    storageBucket: 'restaurante-fadab.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCDq23HGeG-xKUHyAmPYK42od14sxkqs_Y',
    appId: '1:974408287249:android:d6809d8f33770972ea5db0',
    messagingSenderId: '974408287249',
    projectId: 'restaurante-fadab',
    storageBucket: 'restaurante-fadab.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD5gupvmORfbbV5bH_P-SGwopylJZ2AGcQ',
    appId: '1:974408287249:ios:e6bbfb1f7f5262c0ea5db0',
    messagingSenderId: '974408287249',
    projectId: 'restaurante-fadab',
    storageBucket: 'restaurante-fadab.appspot.com',
    iosBundleId: 'com.example.actividad02',
  );
}
