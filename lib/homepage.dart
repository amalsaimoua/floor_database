import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Floor"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: const Text('Add'),
        onPressed: () => Navigator.of(context).pushNamed('addName'),
      ),
    );
  }
}
