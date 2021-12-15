import 'dart:async';

import 'package:ammmmmmal/DAO/dao_person.dart';
import 'package:ammmmmmal/MODLE/patient.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;


part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Patient])
abstract class AppDatabase extends FloorDatabase {
  PatientDao get personDao;
}