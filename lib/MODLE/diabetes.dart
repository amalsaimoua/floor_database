// ignore_for_file: non_constant_identifier_names

import 'package:floor/floor.dart';

@Entity(tableName: 'diabetes',primaryKeys:['id'])
class diabetes {
 @PrimaryKey()
  final int id;
  @ColumnInfo(name: 'diabetesBefore')
  final int diabetesBefore;
  @ColumnInfo(name: 'diabetesAfter')
 final  int diabetesAfter;
  @ColumnInfo(name: 'is_active')
 final  bool isactive;
   diabetes(this.id,this.diabetesAfter,this.diabetesBefore,this.isactive);
 
}
