import 'dart:async';

import 'package:ammmmmmal/DAO/dao_diabetes.dart';
import 'package:ammmmmmal/DAO/dao_patient.dart';
import 'package:ammmmmmal/DAO/dao_pressure.dart';
import 'package:ammmmmmal/DAO/dao_sats.dart';
import 'package:ammmmmmal/MODLE/diabetes.dart';
import 'package:ammmmmmal/MODLE/patient.dart';
import 'package:ammmmmmal/MODLE/pressure.dart';
import 'package:ammmmmmal/MODLE/sats.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;


part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Patient,Sats,diabetes,Pressure])
abstract class AppDatabase extends FloorDatabase {
  PatientDao get personDao;
  SatsDao get satsDao;
  PressureDao get pressureDao;
  DiabetesDao get diabetesDao;

}