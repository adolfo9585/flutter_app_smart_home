import 'package:flutter/material.dart';
import 'package:flutter_app_smart_home/screens/DeviceListScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Smart Home';

    return MaterialApp(
      title: appTitle,
      home: MyHomePage(),
    );
  }
}