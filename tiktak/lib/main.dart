import 'package:flutter/material.dart';
import 'package:tiktak/screen/onboarding.dart';
import 'package:tiktak/screen/playe.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
     debugShowCheckedModeBanner: false,
      home: Playe(),
      routes: {
        Playe.id : (context) => Playe(),
        
      },
    );
  }
}