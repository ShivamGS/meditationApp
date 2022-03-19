import 'package:dhyann/HomePage.dart';
import 'package:dhyann/firstpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

User? firebaseUser = FirebaseAuth.instance.currentUser;
late Widget firstWidget;

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    if (firebaseUser != null) {
      firstWidget = HomePage();
    } else {
      firstWidget = firstpage();
    }
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: firstWidget);
  }
}
