import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ulearning/common/service/storage_service.dart';

class Global {
  static late StorageService storageService;
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyAWFNfdu2MUPqDVWiF4UtgfFlbqep--o6k",
        appId: "1:592869980729:android:bf4a4ea464b31b6193ebe8",
        messagingSenderId: "592869980729",
        projectId: "ulearning-app-ce95d",
      ),
    );
    storageService = await StorageService().init();
  }
}
