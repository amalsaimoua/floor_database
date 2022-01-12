import 'package:ammmmmmal/addname.dart';
import 'package:ammmmmmal/updatepatientp.dart';
import 'package:flutter/material.dart';
import 'DATABASE/database.dart';
import 'homepage.dart';

void main()async {
  runApp(const MyApp());
  final database = $FloorAppDatabase.databaseBuilder('app_database.db').build();
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  HomePage(),
        routes: {
          'addName': (context) => addName(),
          'home' : (context) => HomePage()
        });
  }
}
