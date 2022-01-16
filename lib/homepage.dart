// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:ammmmmmal/MODLE/patient.dart';
import 'package:ammmmmmal/updatepatientp.dart';
import 'package:flutter/material.dart';
import 'DATABASE/database.dart';

class HomePage extends StatefulWidget {
  Patient? patient;
  HomePage({this.patient});

  @override
  _HomePageState createState() => _HomePageState();
}

List<Patient>? patient;

class _HomePageState extends State<HomePage> {
  Future<List<Patient?>> retrieveUsers() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    return await database.personDao.getAllPersons();
  }

  int? id;

  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Floor"),
      ),
      body: FutureBuilder(
        future: retrieveUsers(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Patient?>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    color: Colors.green,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(8.0),
                      title: Row(
                        children: [
                          Text(snapshot.data![index]!.name.toString()),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          InkWell(
                            onTap: () async {
                              final database = await $FloorAppDatabase
                                  .databaseBuilder('app_database.db')
                                  .build();
                              Patient patient = Patient(
                                  id!, name.text, '', 1, int.parse(age.text));
                              // id!, name.text, "", 1, int.parse(age.text)

                              database.personDao.deletePatient(patient);

                              //   deleteFromDb(
                              //       id: patient![index].id,
                              //       name: patient![index].name,
                              //       age: patient![index].Bdate);
                            },
                            child: Icon(Icons.delete),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      updatepatient(snapshot.data![index]),

                                  //   id: snapshot.data![index]!.id,
                                  //  name: snapshot.data![index]!.name,
                                  // bdate: snapshot.data![index]!.Bdate,
                                ),
                              );
                            },
                            child: Icon(Icons.edit),
                          ),
                        ],
                      ),
                      subtitle: Text(snapshot.data![index]!.Bdate.toString()),
                    ));
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).pushNamed('addName'),
      ),
    );
  }

  deleteFromDb({@required int? id, String? name, int? age}) async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final PatientDao = database.personDao;

    Patient patient = Patient(id!, name!, 'image', 1, age!);

    await PatientDao.deletePatient(patient);
  }
}
