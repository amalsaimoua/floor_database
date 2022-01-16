import 'package:ammmmmmal/MODLE/sats.dart';
import 'package:floor/floor.dart';

@dao
abstract class SatsDao {
  @Query('SELECT * FROM sats')
  Future<List<Sats>> getAllsats();

  @insert
  Future<void> insertsats(Sats sats);

  @update
  Future<void> updatesats(Sats sats);

  @delete
  Future <void> deletesats (Sats sats);


}