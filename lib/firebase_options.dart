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
    apiKey: 'AIzaSyBS0I-oIDh07Gigrj08kuaYU3L5luKwAC8',
    appId: '1:163004586993:web:d86c9acda5684597e60250',
    messagingSenderId: '163004586993',
    projectId: 'salih-76f22',
    authDomain: 'salih-76f22.firebaseapp.com',
    storageBucket: 'salih-76f22.appspot.com',
    measurementId: 'G-3EHBVCMPG2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBh7seq3YFL8x8NT_LGWx2XfeXfLaw21Xk',
    appId: '1:163004586993:android:ac66180ac17e3aaae60250',
    messagingSenderId: '163004586993',
    projectId: 'salih-76f22',
    storageBucket: 'salih-76f22.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDAd32RrZ0gtss8MmnciBjAkJcexMPEyAI',
    appId: '1:163004586993:ios:97f8de025b28deaae60250',
    messagingSenderId: '163004586993',
    projectId: 'salih-76f22',
    storageBucket: 'salih-76f22.appspot.com',
    androidClientId: '163004586993-ooju81jtjq9rn1t165aeokbjj2tj2ass.apps.googleusercontent.com',
    iosClientId: '163004586993-9hkkrgkuplrl543plrtqnsrumh9s82vu.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebase',
  );

}