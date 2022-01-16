// ignore_for_file: non_constant_identifier_names

import 'package:floor/floor.dart';

@Entity(tableName: 'pressure',primaryKeys:['id'])
class Pressure {
 @PrimaryKey()
 final  int  id;
  @ColumnInfo(name: 'systolicPressure')
  final int  systolicPressure;
  @ColumnInfo(name: 'diastolicPressure')
  final int  diastolicPressure;
  @ColumnInfo(name: 'is_active')
 final  bool  isactive;
   Pressure(this.id,this.diastolicPressure,this.isactive,this.systolicPressure);
 
}
