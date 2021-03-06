import 'package:flutter/material.dart';

import 'Screens/HomeScreen/home_page.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Weather',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "ArimaMadurai",
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
