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
    apiKey: 'AIzaSyCiqlEzdL5loc68KfK_hTawphRiH6L7Y3U',
    appId: '1:178137769408:web:c8b81a5f53c9b65fe71425',
    messagingSenderId: '178137769408',
    projectId: 'storee-demo-2',
    authDomain: 'storee-demo-2.firebaseapp.com',
    storageBucket: 'storee-demo-2.firebasestorage.app',
    measurementId: 'G-WWBRM1V9ES',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyChryyNOF0wUuRZyS4ul6zYgo16btb0FzU',
    appId: '1:178137769408:android:dbf3c317dea76e50e71425',
    messagingSenderId: '178137769408',
    projectId: 'storee-demo-2',
    storageBucket: 'storee-demo-2.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAFcqrFSfAvtQdF1RGYWLQ5w8Fsb3ytqg4',
    appId: '1:178137769408:ios:c61df8cd3be0b464e71425',
    messagingSenderId: '178137769408',
    projectId: 'storee-demo-2',
    storageBucket: 'storee-demo-2.firebasestorage.app',
    iosBundleId: 'com.example.storeApp2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAFcqrFSfAvtQdF1RGYWLQ5w8Fsb3ytqg4',
    appId: '1:178137769408:ios:c61df8cd3be0b464e71425',
    messagingSenderId: '178137769408',
    projectId: 'storee-demo-2',
    storageBucket: 'storee-demo-2.firebasestorage.app',
    iosBundleId: 'com.example.storeApp2',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCiqlEzdL5loc68KfK_hTawphRiH6L7Y3U',
    appId: '1:178137769408:web:bd3fca888730fedee71425',
    messagingSenderId: '178137769408',
    projectId: 'storee-demo-2',
    authDomain: 'storee-demo-2.firebaseapp.com',
    storageBucket: 'storee-demo-2.firebasestorage.app',
    measurementId: 'G-XWW2JV3LCK',
  );
}
