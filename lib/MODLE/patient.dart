// ignore_for_file: non_constant_identifier_names

import 'package:floor/floor.dart';
//import 'package:flutter/cupertino.dart';

@entity
class Patient {
  @PrimaryKey(autoGenerate: true)
   int? id;
   @ColumnInfo(name:'name')
    String name;

   @ColumnInfo(name:'image')
    String image;

   @ColumnInfo(name:'sex')
    int sex;

   @ColumnInfo(name:'Bdate')
    int Bdate;
  
  Patient(this.id, this.name, this.image, this.sex, this.Bdate);
}