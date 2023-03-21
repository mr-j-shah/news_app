import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quantumitapp/homepage.dart';

import 'loginscreen/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oufer',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: splashscree(),
    );
  }
}

// ignore: camel_case_types
class splashscree extends StatefulWidget {
  splashscree({Key? key}) : super(key: key);

  @override
  State<splashscree> createState() => _splashscreeState();
}

class _splashscreeState extends State<splashscree> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              FirebaseAuth.instance.currentUser == null ? login() : homepage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(227, 255, 255, 255),
            ],
          )),
          child: Center(child: FlutterLogo()),
        ),
      ),
    );
  }
}
