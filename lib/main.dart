import 'package:flutter/material.dart';
import 'package:ui_instagram/pages/avatar.dart';
import 'package:ui_instagram/pages/home_page.dart';
import 'package:ui_instagram/pages/login_page.dart';
import 'package:ui_instagram/pages/sign_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home: LoginPage(),
      routes: {
        LoginPage.id: (context)=>LoginPage(),
        SignPage.id: (context)=>SignPage(),
        HomePage.id: (context)=>HomePage(),
        Avatars.id: (context)=>Avatars(),
      },
    );
  }
}


