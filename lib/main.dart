import 'package:flutter/material.dart';
import 'package:profilepage/profiles/profile1/profile_1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Page',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Profile1(),
    );
  }
}
