import 'package:chmavha/src/routes/routes.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'challenge',
      initialRoute: 'mylist',
      routes: getAplicationRoutes(),
      theme: ThemeData(
        primaryColor: Color(0XFF4042C9),
      ),
    );
  }
}