import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_anuncios/pages/home_page.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (BuildContext context) => HomePage(),
      },
    );
  }
}
