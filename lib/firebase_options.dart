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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDfnUVEJvIXMEiJlAOZcaiPpSf36XiCBuM',
    appId: '1:650878513370:android:d46c5f8922e04afb6df5e3',
    messagingSenderId: '650878513370',
    projectId: 'musica-87d5f',
    storageBucket: 'musica-87d5f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA1Fd58hvou0WeHPeqJPmB12V1D-fv46YM',
    appId: '1:650878513370:ios:f5a07ae725395f346df5e3',
    messagingSenderId: '650878513370',
    projectId: 'musica-87d5f',
    storageBucket: 'musica-87d5f.appspot.com',
    iosBundleId: 'com.example.musica',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA1Fd58hvou0WeHPeqJPmB12V1D-fv46YM',
    appId: '1:650878513370:ios:f5a07ae725395f346df5e3',
    messagingSenderId: '650878513370',
    projectId: 'musica-87d5f',
    storageBucket: 'musica-87d5f.appspot.com',
    iosBundleId: 'com.example.musica',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCyzRo5tBy0gdRYcMhIW2KyQsxSIqaIfTY',
    appId: '1:650878513370:web:4c9d888fc062ed906df5e3',
    messagingSenderId: '650878513370',
    projectId: 'musica-87d5f',
    authDomain: 'musica-87d5f.firebaseapp.com',
    storageBucket: 'musica-87d5f.appspot.com',
  );
}