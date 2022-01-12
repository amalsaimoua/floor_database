// ignore_for_file: prefer_const_constructors, camel_case_types, avoid_print, prefer_final_fields, use_key_in_widget_constructors, must_be_immutable
import 'package:ammmmmmal/MODLE/patient.dart';
import 'package:ammmmmmal/homepage.dart';
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';

import 'DAO/dao_person.dart';
import 'DATABASE/database.dart';

class updatepatient extends StatefulWidget {
  String? name;
  int? id;
  int? bdate;

  updatepatient({this.name, this.id, this.bdate});

  @override
  State<updatepatient> createState() => _updatepatientState();
}

class _updatepatientState extends State<updatepatient> {
  Patient? patient;
  PatientDao? dao;
  Database? db;
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                'Name',
                style: TextStyle(fontSize: 20),
              ),
              TextField(
                controller: name = TextEditingController(text: widget.name),
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
                controller: age =
                    TextEditingController(text: widget.bdate.toString()),
                autofocus: false,
              ),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                  onPressed: () async {
                    final database = await $FloorAppDatabase
                        .databaseBuilder('app_database.db')
                        .build();
                    Patient patient = Patient(
                        widget.id, name.text, "", 1, int.parse(age.text));

                    database.personDao.updatePerson(patient);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Text('save')),
            ],
          ),
        ));
  }
}
