// ignore_for_file: prefer_const_constructors, camel_case_types, avoid_print
import 'package:ammmmmmal/MODLE/patient.dart';
import 'package:flutter/material.dart';

class updatepatient extends StatefulWidget {
  const updatepatient({
    Key? key,
    required this.patient,
  }) : super(key: key);
  final Patient patient;
  @override
  _updatepatientState createState() => _updatepatientState();
}

class _updatepatientState extends State<updatepatient> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  //  late final Patient patient;
  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // final toUpdateInfo = ModalRoute.of(context)!.settings.arguments as HomePage;
    return Scaffold(
        appBar: AppBar(
          title: Text('Update ur Info'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'Name:',
                style: TextStyle(fontSize: 20),
              ),
              TextField(
                controller: name,
                autofocus: false,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Age:',
                style: TextStyle(fontSize: 20),
              ),
              TextField(
                controller: age,
                autofocus: false,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                  onPressed: () {
                    print(patient.name);
                  },
                  child: Text('save')),
            ],
          ),
        ));
  }
}
