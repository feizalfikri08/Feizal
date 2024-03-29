import 'package:flutter/material.dart';
import 'package:gojek/constans.dart';
import 'package:gojek/launcher/launcher_view.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Traveling',
      theme: new ThemeData(
        fontFamily: 'NeoSans',
        primaryColor: TravelPalette.green,
        accentColor: TravelPalette.green,
      ),
      home: new LauncherPage(),
    );
  }
}
