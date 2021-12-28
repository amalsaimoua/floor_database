import 'package:ammmmmmal/MODLE/patient.dart';
import 'package:floor/floor.dart';
import 'package:flutter/cupertino.dart';

@dao
abstract class PatientDao {
  @Query('SELECT * FROM Patient')
  Future<List<Patient>> getAllPersons();

  @insert
  Future<void> insertPerson(Patient patient);

  // @Query ('DELETE FROM Patient WHERE id=id')
  // Stream <List<Patient>> clearPatientByid (int id);
   
  @update
  Future<void> updatePerson(Patient patient);

  @delete
  Future <void> deletePatient (Patient patient);


}