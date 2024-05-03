import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyD3XLXjo_FuJNvzCwa2loLUMa-wecBdOLI",
            authDomain: "page-login-imlit0.firebaseapp.com",
            projectId: "page-login-imlit0",
            storageBucket: "page-login-imlit0.appspot.com",
            messagingSenderId: "954443570394",
            appId: "1:954443570394:web:6158d78d99cd3cf91799e3"));
  } else {
    await Firebase.initializeApp();
  }
}
