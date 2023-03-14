// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $Floorfloor_database {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$floor_databaseBuilder databaseBuilder(String name) =>
      _$floor_databaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$floor_databaseBuilder inMemoryDatabaseBuilder() =>
      _$floor_databaseBuilder(null);
}

class _$floor_databaseBuilder {
  _$floor_databaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$floor_databaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$floor_databaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<floor_database> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$floor_database();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$floor_database extends floor_database {
  _$floor_database([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  LoginDeo? _logindeoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 4,
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
            'CREATE TABLE IF NOT EXISTS `login_model` (`id` INTEGER NOT NULL, `email` TEXT NOT NULL, `password` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  LoginDeo get logindeo {
    return _logindeoInstance ??= _$LoginDeo(database, changeListener);
  }
}

class _$LoginDeo extends LoginDeo {
  _$LoginDeo(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _login_modelInsertionAdapter = InsertionAdapter(
            database,
            'login_model',
            (login_model item) => <String, Object?>{
                  'id': item.id,
                  'email': item.email,
                  'password': item.password
                }),
        _login_modelUpdateAdapter = UpdateAdapter(
            database,
            'login_model',
            ['id'],
            (login_model item) => <String, Object?>{
                  'id': item.id,
                  'email': item.email,
                  'password': item.password
                }),
        _login_modelDeletionAdapter = DeletionAdapter(
            database,
            'login_model',
            ['id'],
            (login_model item) => <String, Object?>{
                  'id': item.id,
                  'email': item.email,
                  'password': item.password
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<login_model> _login_modelInsertionAdapter;

  final UpdateAdapter<login_model> _login_modelUpdateAdapter;

  final DeletionAdapter<login_model> _login_modelDeletionAdapter;

  @override
  Future<login_model?> getData() async {
    return _queryAdapter.query('SELECT * FROM login_model',
        mapper: (Map<String, Object?> row) =>
            login_model(row['email'] as String, row['password'] as String));
  }

  @override
  Future<void> insertData(login_model m) async {
    await _login_modelInsertionAdapter.insert(m, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateData(login_model m) async {
    await _login_modelUpdateAdapter.update(m, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteData(login_model m) async {
    await _login_modelDeletionAdapter.delete(m);
  }
}
