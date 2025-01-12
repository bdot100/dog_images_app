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
    apiKey: 'AIzaSyCibB7tMqFbC9TS8Y6uNnnEURdiBcXPxXs',
    appId: '1:305755824007:web:6ab4e8cad7fc03f0d63d22',
    messagingSenderId: '305755824007',
    projectId: 'dog-images-app-d0b48',
    authDomain: 'dog-images-app-d0b48.firebaseapp.com',
    storageBucket: 'dog-images-app-d0b48.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAPTwqZ9fqKgWMCNGhykZQHJncauO9EFZs',
    appId: '1:305755824007:android:8435fb08a5d868f6d63d22',
    messagingSenderId: '305755824007',
    projectId: 'dog-images-app-d0b48',
    storageBucket: 'dog-images-app-d0b48.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDumea8WsRSBHO0kB0k41WbSDc4z10CrSo',
    appId: '1:305755824007:ios:81e8863297cfcb5fd63d22',
    messagingSenderId: '305755824007',
    projectId: 'dog-images-app-d0b48',
    storageBucket: 'dog-images-app-d0b48.firebasestorage.app',
    iosBundleId: 'com.example.dogImagesApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDumea8WsRSBHO0kB0k41WbSDc4z10CrSo',
    appId: '1:305755824007:ios:81e8863297cfcb5fd63d22',
    messagingSenderId: '305755824007',
    projectId: 'dog-images-app-d0b48',
    storageBucket: 'dog-images-app-d0b48.firebasestorage.app',
    iosBundleId: 'com.example.dogImagesApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCibB7tMqFbC9TS8Y6uNnnEURdiBcXPxXs',
    appId: '1:305755824007:web:b74c35706eb93a15d63d22',
    messagingSenderId: '305755824007',
    projectId: 'dog-images-app-d0b48',
    authDomain: 'dog-images-app-d0b48.firebaseapp.com',
    storageBucket: 'dog-images-app-d0b48.firebasestorage.app',
  );
}
