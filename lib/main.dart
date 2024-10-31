
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'RealTimeDataBase/AddPost.dart';
import 'firebase_options.dart';
import 'SignUp.dart';
import 'dart:io' if (dart.library.html) 'package:your_package/web_specific.dart';
import 'dart:io' if (dart.library.html) 'package:your_package/web_specific.dart';
import 'dart:io' if (dart.library.html) 'package:your_package/web_specific.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AddPost(),
    );
  }
}
