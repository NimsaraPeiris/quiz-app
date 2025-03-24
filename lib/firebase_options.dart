import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyCr29Ji3fhge0jxSkjo9wnyZTQwsqAjehY',
    appId: '1:565214350627:web:7fad285a6e5dd2c81a1096',
    messagingSenderId: '565214350627',
    projectId: 'phi-app-62c8f',
    authDomain: 'phi-app-62c8f.firebaseapp.com',
    storageBucket: 'phi-app-62c8f.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBmrqUZ-F-uA-mHutZPa3AUxicQdV6g4ZQ',
    appId: '1:565214350627:android:3cd8a20455bbb66c1a1096',
    messagingSenderId: '565214350627',
    projectId: 'phi-app-62c8f',
    storageBucket: 'phi-app-62c8f.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBGFPuMfLk02ZEJRCIwXzfQyzRrmQ5p7pk',
    appId: '1:565214350627:ios:83cf7d8a4a4270d21a1096',
    messagingSenderId: '565214350627',
    projectId: 'phi-app-62c8f',
    storageBucket: 'phi-app-62c8f.firebasestorage.app',
    iosBundleId: 'com.example.phiApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBGFPuMfLk02ZEJRCIwXzfQyzRrmQ5p7pk',
    appId: '1:565214350627:ios:83cf7d8a4a4270d21a1096',
    messagingSenderId: '565214350627',
    projectId: 'phi-app-62c8f',
    storageBucket: 'phi-app-62c8f.firebasestorage.app',
    iosBundleId: 'com.example.phiApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCr29Ji3fhge0jxSkjo9wnyZTQwsqAjehY',
    appId: '1:565214350627:web:fba11a06d40e0a321a1096',
    messagingSenderId: '565214350627',
    projectId: 'phi-app-62c8f',
    authDomain: 'phi-app-62c8f.firebaseapp.com',
    storageBucket: 'phi-app-62c8f.firebasestorage.app',
  );

}