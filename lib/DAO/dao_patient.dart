import 'package:ammmmmmal/MODLE/patient.dart';
import 'package:floor/floor.dart';

@dao
abstract class PatientDao {
  @Query('SELECT * FROM Patient')
  Future<List<Patient?>> getAllPersons();

  @insert
  Future<void> insertPerson(Patient patient);
   
  @update
  Future<void> updatePerson(Patient patient);

  @delete
  Future <void> deletePatient (Patient patient);


}