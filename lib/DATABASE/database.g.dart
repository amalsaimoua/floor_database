// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  PatientDao? _personDaoInstance;

  SatsDao? _satsDaoInstance;

  PressureDao? _pressureDaoInstance;

  DiabetesDao? _diabetesDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Patient` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `image` TEXT NOT NULL, `sex` INTEGER NOT NULL, `Bdate` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `sats` (`id` INTEGER NOT NULL, `sats value` INTEGER NOT NULL, `is_active` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `diabetes` (`id` INTEGER NOT NULL, `diabetesBefore` INTEGER NOT NULL, `diabetesAfter` INTEGER NOT NULL, `is_active` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `pressure` (`id` INTEGER NOT NULL, `systolicPressure` INTEGER NOT NULL, `diastolicPressure` INTEGER NOT NULL, `is_active` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PatientDao get personDao {
    return _personDaoInstance ??= _$PatientDao(database, changeListener);
  }

  @override
  SatsDao get satsDao {
    return _satsDaoInstance ??= _$SatsDao(database, changeListener);
  }

  @override
  PressureDao get pressureDao {
    return _pressureDaoInstance ??= _$PressureDao(database, changeListener);
  }

  @override
  DiabetesDao get diabetesDao {
    return _diabetesDaoInstance ??= _$DiabetesDao(database, changeListener);
  }
}

class _$PatientDao extends PatientDao {
  _$PatientDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _patientInsertionAdapter = InsertionAdapter(
            database,
            'Patient',
            (Patient item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'image': item.image,
                  'sex': item.sex,
                  'Bdate': item.Bdate
                }),
        _patientUpdateAdapter = UpdateAdapter(
            database,
            'Patient',
            ['id'],
            (Patient item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'image': item.image,
                  'sex': item.sex,
                  'Bdate': item.Bdate
                }),
        _patientDeletionAdapter = DeletionAdapter(
            database,
            'Patient',
            ['id'],
            (Patient item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'image': item.image,
                  'sex': item.sex,
                  'Bdate': item.Bdate
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Patient> _patientInsertionAdapter;

  final UpdateAdapter<Patient> _patientUpdateAdapter;

  final DeletionAdapter<Patient> _patientDeletionAdapter;

  @override
  Future<List<Patient?>> getAllPersons() async {
    return _queryAdapter.queryList(
        'SELECT * FROM Patient LEFT JOIN pressure LEFT JOIN diabetes LEFT JOIN sats',
        mapper: (Map<String, Object?> row) => Patient(
            row['id'] as int,
            row['name'] as String,
            row['image'] as String,
            row['sex'] as int,
            row['Bdate'] as int));
  }

  @override
  Future<void> insertPerson(Patient patient) async {
    await _patientInsertionAdapter.insert(patient, OnConflictStrategy.abort);
  }

  @override
  Future<void> updatePerson(Patient patient) async {
    await _patientUpdateAdapter.update(patient, OnConflictStrategy.abort);
  }

  @override
  Future<void> deletePatient(Patient patient) async {
    await _patientDeletionAdapter.delete(patient);
  }
}

class _$SatsDao extends SatsDao {
  _$SatsDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _satsInsertionAdapter = InsertionAdapter(
            database,
            'sats',
            (Sats item) => <String, Object?>{
                  'id': item.id,
                  'sats value': item.satsValue,
                  'is_active': item.isactive ? 1 : 0
                }),
        _satsUpdateAdapter = UpdateAdapter(
            database,
            'sats',
            ['id'],
            (Sats item) => <String, Object?>{
                  'id': item.id,
                  'sats value': item.satsValue,
                  'is_active': item.isactive ? 1 : 0
                }),
        _satsDeletionAdapter = DeletionAdapter(
            database,
            'sats',
            ['id'],
            (Sats item) => <String, Object?>{
                  'id': item.id,
                  'sats value': item.satsValue,
                  'is_active': item.isactive ? 1 : 0
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Sats> _satsInsertionAdapter;

  final UpdateAdapter<Sats> _satsUpdateAdapter;

  final DeletionAdapter<Sats> _satsDeletionAdapter;

  @override
  Future<List<Sats>> getAllsats() async {
    return _queryAdapter.queryList('SELECT * FROM sats',
        mapper: (Map<String, Object?> row) => Sats(row['id'] as int,
            (row['is_active'] as int) != 0, row['sats value'] as int));
  }

  @override
  Future<void> insertsats(Sats sats) async {
    await _satsInsertionAdapter.insert(sats, OnConflictStrategy.abort);
  }

  @override
  Future<void> updatesats(Sats sats) async {
    await _satsUpdateAdapter.update(sats, OnConflictStrategy.abort);
  }

  @override
  Future<void> deletesats(Sats sats) async {
    await _satsDeletionAdapter.delete(sats);
  }
}

class _$PressureDao extends PressureDao {
  _$PressureDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _pressureInsertionAdapter = InsertionAdapter(
            database,
            'pressure',
            (Pressure item) => <String, Object?>{
                  'id': item.id,
                  'systolicPressure': item.systolicPressure,
                  'diastolicPressure': item.diastolicPressure,
                  'is_active': item.isactive ? 1 : 0
                }),
        _pressureUpdateAdapter = UpdateAdapter(
            database,
            'pressure',
            ['id'],
            (Pressure item) => <String, Object?>{
                  'id': item.id,
                  'systolicPressure': item.systolicPressure,
                  'diastolicPressure': item.diastolicPressure,
                  'is_active': item.isactive ? 1 : 0
                }),
        _pressureDeletionAdapter = DeletionAdapter(
            database,
            'pressure',
            ['id'],
            (Pressure item) => <String, Object?>{
                  'id': item.id,
                  'systolicPressure': item.systolicPressure,
                  'diastolicPressure': item.diastolicPressure,
                  'is_active': item.isactive ? 1 : 0
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Pressure> _pressureInsertionAdapter;

  final UpdateAdapter<Pressure> _pressureUpdateAdapter;

  final DeletionAdapter<Pressure> _pressureDeletionAdapter;

  @override
  Future<List<Pressure>> getAllPressure() async {
    return _queryAdapter.queryList('SELECT * FROM pressure',
        mapper: (Map<String, Object?> row) => Pressure(
            row['id'] as int,
            row['diastolicPressure'] as int,
            (row['is_active'] as int) != 0,
            row['systolicPressure'] as int));
  }

  @override
  Future<void> insertpressure(Pressure pressure) async {
    await _pressureInsertionAdapter.insert(pressure, OnConflictStrategy.abort);
  }

  @override
  Future<void> updatepressure(Pressure pressure) async {
    await _pressureUpdateAdapter.update(pressure, OnConflictStrategy.abort);
  }

  @override
  Future<void> deletepressure(Pressure pressure) async {
    await _pressureDeletionAdapter.delete(pressure);
  }
}

class _$DiabetesDao extends DiabetesDao {
  _$DiabetesDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _diabetesInsertionAdapter = InsertionAdapter(
            database,
            'diabetes',
            (diabetes item) => <String, Object?>{
                  'id': item.id,
                  'diabetesBefore': item.diabetesBefore,
                  'diabetesAfter': item.diabetesAfter,
                  'is_active': item.isactive ? 1 : 0
                }),
        _diabetesUpdateAdapter = UpdateAdapter(
            database,
            'diabetes',
            ['id'],
            (diabetes item) => <String, Object?>{
                  'id': item.id,
                  'diabetesBefore': item.diabetesBefore,
                  'diabetesAfter': item.diabetesAfter,
                  'is_active': item.isactive ? 1 : 0
                }),
        _diabetesDeletionAdapter = DeletionAdapter(
            database,
            'diabetes',
            ['id'],
            (diabetes item) => <String, Object?>{
                  'id': item.id,
                  'diabetesBefore': item.diabetesBefore,
                  'diabetesAfter': item.diabetesAfter,
                  'is_active': item.isactive ? 1 : 0
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<diabetes> _diabetesInsertionAdapter;

  final UpdateAdapter<diabetes> _diabetesUpdateAdapter;

  final DeletionAdapter<diabetes> _diabetesDeletionAdapter;

  @override
  Future<List<diabetes>> getAllDiabetes() async {
    return _queryAdapter.queryList('SELECT * FROM diabetes',
        mapper: (Map<String, Object?> row) => diabetes(
            row['id'] as int,
            row['diabetesAfter'] as int,
            row['diabetesBefore'] as int,
            (row['is_active'] as int) != 0));
  }

  @override
  Future<void> insertDiabetes(diabetes diabetes) async {
    await _diabetesInsertionAdapter.insert(diabetes, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateDiabetes(diabetes diabetes) async {
    await _diabetesUpdateAdapter.update(diabetes, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteDiabetes(diabetes diabetes) async {
    await _diabetesDeletionAdapter.delete(diabetes);
  }
}
