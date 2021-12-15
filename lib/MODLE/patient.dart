import 'package:floor/floor.dart';

@entity
class Patient {
  @primaryKey
   int id;
   @ColumnInfo(name:'name')
   final String name;

   @ColumnInfo(name:'image')
   final String image;

   @ColumnInfo(name:'sex')
   final int sex;

   @ColumnInfo(name:'Bdate')
   final int Bdate;
  
  Patient(this.id, this.name, this.image, this.sex, this.Bdate);
}