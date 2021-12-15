import 'package:ammmmmmal/MODLE/patient.dart';
import 'package:floor/floor.dart';

@dao
abstract class PatientDao {
  @Query('SELECT * FROM Patient')
  Future<List<Patient>> getAllPersons();
  @insert
  Future<void> insertPerson(Patient patient);
}