// ignore_for_file: non_constant_identifier_names

import 'package:ammmmmmal/MODLE/diabetes.dart';
import 'package:ammmmmmal/MODLE/pressure.dart';
import 'package:ammmmmmal/MODLE/sats.dart';
import 'package:floor/floor.dart';
//import 'package:flutter/cupertino.dart';

@entity
//   tableName:'Patient',primaryKeys: ['id'],
// foreignKeys: [
//   ForeignKey(childColumns: ['sats_id'],parentColumns: ['id'],entity: Sats),
//   ForeignKey(childColumns: ['pressure_id'],parentColumns: ['id'],entity: Pressure),
//   ForeignKey(childColumns: ['diabetes_id'],parentColumns: ['id'],entity: diabetes),

// ] )
class Patient {
  @PrimaryKey()
   final int id;
  //  final int sats_id ;
  //  final int pressure_id ;
  //  final int diabetes_id ;

   @ColumnInfo(name:'name')
   final String name;

   @ColumnInfo(name:'image')
   final String image;

   @ColumnInfo(name:'sex')
   final int sex;

   @ColumnInfo(name:'Bdate')
  final int Bdate;
  
  Patient(this.id, this.name, this.image, this.sex, this.Bdate);
   //this.sats_id, this.pressure_id, this.diabetes_id);
}