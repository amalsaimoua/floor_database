// ignore_for_file: prefer_const_constructors, avoid_print, non_constant_identifier_names

import 'package:ammmmmmal/DAO/dao_person.dart';
import 'package:ammmmmmal/MODLE/patient.dart';
import 'package:ammmmmmal/homepage.dart';
import 'package:floor/floor.dart';

import 'package:flutter/material.dart';

import 'DATABASE/database.dart';

class addName extends StatefulWidget {
  const addName({Key? key}) : super(key: key);

  @override
  _addNameState createState() => _addNameState();
}

class _addNameState extends State<addName> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  PatientDao? patientDao;
  Patient? patient;
  int? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add name'),
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
              ElevatedButton(
                  onPressed: () {
                    inserttodatabase(name: name.text, age: int.parse(age.text));
                    
                  },
                  // async {
                  //   final database = await $FloorAppDatabase
                  //       .databaseBuilder('app_database.db')
                  //       .build();

                  //   setState(() {
                  //     database.personDao.insertPerson(Patient(
                  //         id, name.text, 'image', 1, int.parse(age.text)));
                  //     Navigator.of(context).pop();
                  //     //              (

                  //     // MaterialPageRoute(builder: (context) => const HomePage()));
                  //   });
                  // },
                  child: Text('save')),
              
            ],
          ),
        )
        );
  }

  inserttodatabase({@required String? name, @required int? age}) async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final PatientDao = database.personDao;
    Patient patient = Patient(id, name!, 'image', 1, age!);

    await PatientDao.insertPerson(patient);
  }

  
}
