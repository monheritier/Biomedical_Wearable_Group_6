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

  ActivityDao? _activityDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 3,
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
            'CREATE TABLE IF NOT EXISTS `Activity` (`distance` REAL NOT NULL, `dateOfMonitoring` INTEGER NOT NULL, PRIMARY KEY (`distance`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ActivityDao get activityDao {
    return _activityDaoInstance ??= _$ActivityDao(database, changeListener);
  }
}

class _$ActivityDao extends ActivityDao {
  _$ActivityDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _activityInsertionAdapter = InsertionAdapter(
            database,
            'Activity',
            (Activity item) => <String, Object?>{
                  'distance': item.distance,
                  'dateOfMonitoring':
                      _dateTimeConverter.encode(item.dateOfMonitoring)
                }),
        _activityUpdateAdapter = UpdateAdapter(
            database,
            'Activity',
            ['distance'],
            (Activity item) => <String, Object?>{
                  'distance': item.distance,
                  'dateOfMonitoring':
                      _dateTimeConverter.encode(item.dateOfMonitoring)
                }),
        _activityDeletionAdapter = DeletionAdapter(
            database,
            'Activity',
            ['distance'],
            (Activity item) => <String, Object?>{
                  'distance': item.distance,
                  'dateOfMonitoring':
                      _dateTimeConverter.encode(item.dateOfMonitoring)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Activity> _activityInsertionAdapter;

  final UpdateAdapter<Activity> _activityUpdateAdapter;

  final DeletionAdapter<Activity> _activityDeletionAdapter;

  @override
  Future<List<Activity>> findAllActivity() async {
    return _queryAdapter.queryList('SELECT * FROM Activity',
        mapper: (Map<String, Object?> row) => Activity(
            row['distance'] as double,
            _dateTimeConverter.decode(row['dateOfMonitoring'] as int)));
  }

  @override
  Future<void> insertActivity(Activity activity) async {
    await _activityInsertionAdapter.insert(activity, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateActivity(Activity activity) async {
    await _activityUpdateAdapter.update(activity, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteActivity(Activity task) async {
    await _activityDeletionAdapter.delete(task);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
