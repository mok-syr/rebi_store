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
    apiKey: 'AIzaSyAKiOf3VTzGHhLlFmlS2V6FcaXFVsfK1VE',
    appId: '1:794768681149:web:b6f7632900538dcd916fd4',
    messagingSenderId: '794768681149',
    projectId: 'rebi-store',
    authDomain: 'rebi-store.firebaseapp.com',
    storageBucket: 'rebi-store.appspot.com',
    measurementId: 'G-WLQ52K1PWL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCIm6c674ocU9SdIBNqiplbbuBZIZWKp4Y',
    appId: '1:794768681149:android:3eb6ef315dd183b0916fd4',
    messagingSenderId: '794768681149',
    projectId: 'rebi-store',
    storageBucket: 'rebi-store.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB9dY1sjMSeUihu1yG2U2XxNs6N8MLjQyU',
    appId: '1:794768681149:ios:840bab2f1bb271e5916fd4',
    messagingSenderId: '794768681149',
    projectId: 'rebi-store',
    storageBucket: 'rebi-store.appspot.com',
    iosClientId: '794768681149-vrp61l2mjd9jdcj34trqinohaqi301qg.apps.googleusercontent.com',
    iosBundleId: 'net.rebi.rebiStore',
  );
}
