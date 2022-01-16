// ignore_for_file: non_constant_identifier_names

import 'package:floor/floor.dart';

@Entity(tableName: 'sats',primaryKeys:['id'])
class Sats {
 @PrimaryKey()
 final int id;
  @ColumnInfo(name: 'sats value')
 final int satsValue;
  @ColumnInfo(name: 'is_active')
 final bool isactive;
   Sats(this.id,this.isactive,this.satsValue);
 
}
