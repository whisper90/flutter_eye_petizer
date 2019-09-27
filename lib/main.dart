import 'package:flutter/material.dart';
import 'package:flutter_eye_petizer/page/main_page.dart';
import 'package:flutter_eye_petizer/bloc/bloc_provider.dart';
import 'package:flutter_eye_petizer/page/daily_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<StatefulWidget> createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Eye Petizer',
//      theme: ThemeData(
//        primaryColor: Colors.blue
//      ),
        home: MainPage()
    );
  }
}
