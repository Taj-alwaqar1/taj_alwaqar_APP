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
    apiKey: 'AIzaSyCXpHPkvy8l5HD-igIaUHSjldBop0vKTnw',
    appId: '1:312456093382:web:a17645db6e8c619a6641c7',
    messagingSenderId: '312456093382',
    projectId: 'taj-alwaqar-app-530ce',
    authDomain: 'taj-alwaqar-app-530ce.firebaseapp.com',
    storageBucket: 'taj-alwaqar-app-530ce.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDvG85aHQF1mg6_rwy91ClcMn4MD5nR_rY',
    appId: '1:312456093382:android:1137faf45a318a266641c7',
    messagingSenderId: '312456093382',
    projectId: 'taj-alwaqar-app-530ce',
    storageBucket: 'taj-alwaqar-app-530ce.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAe1pGdN-tz2fS92vtG_2Ilov6lWi_EUmA',
    appId: '1:312456093382:ios:6c2dea633f6822336641c7',
    messagingSenderId: '312456093382',
    projectId: 'taj-alwaqar-app-530ce',
    storageBucket: 'taj-alwaqar-app-530ce.appspot.com',
    iosBundleId: 'com.example.tajAlwaqar',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAe1pGdN-tz2fS92vtG_2Ilov6lWi_EUmA',
    appId: '1:312456093382:ios:2acecc6cd067ade86641c7',
    messagingSenderId: '312456093382',
    projectId: 'taj-alwaqar-app-530ce',
    storageBucket: 'taj-alwaqar-app-530ce.appspot.com',
    iosBundleId: 'com.example.tajAlwaqar.RunnerTests',
  );
}