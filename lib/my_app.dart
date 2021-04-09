import 'package:flutter/material.dart';

import 'home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JSON API HTTP Requests Methods',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
