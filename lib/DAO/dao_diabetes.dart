import 'package:ammmmmmal/MODLE/diabetes.dart';
import 'package:floor/floor.dart';

@dao
abstract class DiabetesDao {
  @Query('SELECT * FROM diabetes')
  Future<List<diabetes>> getAllDiabetes();

  @insert
  Future<void> insertDiabetes(diabetes diabetes);

  @update
  Future<void> updateDiabetes(diabetes diabetes);

  @delete
  Future <void> deleteDiabetes(diabetes diabetes);


}