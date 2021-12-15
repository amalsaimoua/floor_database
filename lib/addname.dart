// ignore_for_file: prefer_const_constructors

import 'package:ammmmmmal/DAO/dao_person.dart';
import 'package:ammmmmmal/MODLE/patient.dart';
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';

class addName extends StatefulWidget {
  const addName({Key? key}) : super(key: key);

  @override
  _addNameState createState() => _addNameState();
}

class _addNameState extends State<addName> {
  TextEditingController name = TextEditingController();
    TextEditingController age = TextEditingController();
    PatientDao? patientDao ;
    Patient? patient;
    Database? database;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('floor'),
        ),
        body: SingleChildScrollView(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
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
              ElevatedButton(onPressed: () {
               patientDao!.insertPerson(Patient( 1,name.text,'image' ,int.parse(age.text),1));
               print('$name');
              }, 
              child: Text('save'))
            ],
          ),
        ));
  }
}
