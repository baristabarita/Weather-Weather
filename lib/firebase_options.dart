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
    apiKey: 'AIzaSyAgHmSh8fULhAu5bq5gC6XI-KZwV5LiU1s',
    appId: '1:627490366523:web:6acd615a1ee7fd18aaa81e',
    messagingSenderId: '627490366523',
    projectId: 'weather-weather-e0d6a',
    authDomain: 'weather-weather-e0d6a.firebaseapp.com',
    storageBucket: 'weather-weather-e0d6a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCkq5KzOn1EWSHZCoWNzDW9yhoe8Bnt4vI',
    appId: '1:627490366523:android:01578233a9758059aaa81e',
    messagingSenderId: '627490366523',
    projectId: 'weather-weather-e0d6a',
    storageBucket: 'weather-weather-e0d6a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCpd5UAXI12NvAEY4AuOGxSVvNhGl0Q5B4',
    appId: '1:627490366523:ios:be89fecdbea51f71aaa81e',
    messagingSenderId: '627490366523',
    projectId: 'weather-weather-e0d6a',
    storageBucket: 'weather-weather-e0d6a.appspot.com',
    iosBundleId: 'com.example.weatherWeather',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCpd5UAXI12NvAEY4AuOGxSVvNhGl0Q5B4',
    appId: '1:627490366523:ios:bb386f860d5d4295aaa81e',
    messagingSenderId: '627490366523',
    projectId: 'weather-weather-e0d6a',
    storageBucket: 'weather-weather-e0d6a.appspot.com',
    iosBundleId: 'com.example.weatherWeather.RunnerTests',
  );
}
