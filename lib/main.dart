import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ungreview/states/loginpage.dart';
import 'package:ungreview/states/main_home.dart';
import 'package:ungreview/utility/app_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    FirebaseAuth.instance.authStateChanges().listen((event) {
      if (event == null) {
        //ไม่ได้ login
        runApp(const MyApp());
      } else {
        // login
        AppService().findCurrentUserModel().then((value) => runApp(const MyApp()));
      }
    });
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const LoginPage(),
      theme: ThemeData(
        useMaterial3: true,
        // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepOrange),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
    );
  }
}
