
import 'package:ammmmmmal/MODLE/pressure.dart';
import 'package:floor/floor.dart';

@dao
abstract class PressureDao {
  @Query('SELECT * FROM pressure')
  Future<List<Pressure>> getAllPressure();

  @insert
  Future<void> insertpressure(Pressure pressure);
   
  @update
  Future<void> updatepressure(Pressure pressure);

  @delete
  Future <void> deletepressure (Pressure pressure);


}