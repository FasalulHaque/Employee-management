// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Employeedatabase.dart';

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

  EmployeeDao? _emplDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
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
            'CREATE TABLE IF NOT EXISTS `AddEmployee` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `joiningDate` TEXT NOT NULL, `name` TEXT NOT NULL, `desstination` TEXT NOT NULL, `number` TEXT NOT NULL, `address` TEXT NOT NULL, `basicPay` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  EmployeeDao get emplDao {
    return _emplDaoInstance ??= _$EmployeeDao(database, changeListener);
  }
}

class _$EmployeeDao extends EmployeeDao {
  _$EmployeeDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _addEmployeeInsertionAdapter = InsertionAdapter(
            database,
            'AddEmployee',
            (AddEmployee item) => <String, Object?>{
                  'id': item.id,
                  'joiningDate': item.joiningDate,
                  'name': item.name,
                  'desstination': item.desstination,
                  'number': item.number,
                  'address': item.address,
                  'basicPay': item.basicPay
                },
            changeListener),
        _addEmployeeUpdateAdapter = UpdateAdapter(
            database,
            'AddEmployee',
            ['id'],
            (AddEmployee item) => <String, Object?>{
                  'id': item.id,
                  'joiningDate': item.joiningDate,
                  'name': item.name,
                  'desstination': item.desstination,
                  'number': item.number,
                  'address': item.address,
                  'basicPay': item.basicPay
                },
            changeListener),
        _addEmployeeDeletionAdapter = DeletionAdapter(
            database,
            'AddEmployee',
            ['id'],
            (AddEmployee item) => <String, Object?>{
                  'id': item.id,
                  'joiningDate': item.joiningDate,
                  'name': item.name,
                  'desstination': item.desstination,
                  'number': item.number,
                  'address': item.address,
                  'basicPay': item.basicPay
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<AddEmployee> _addEmployeeInsertionAdapter;

  final UpdateAdapter<AddEmployee> _addEmployeeUpdateAdapter;

  final DeletionAdapter<AddEmployee> _addEmployeeDeletionAdapter;

  @override
  Future<List<AddEmployee>> findAllEmployee() async {
    return _queryAdapter.queryList('select * from addEmployee',
        mapper: (Map<String, Object?> row) => AddEmployee(
            row['id'] as int,
            row['joiningDate'] as String,
            row['name'] as String,
            row['desstination'] as String,
            row['number'] as String,
            row['address'] as String,
            row['basicPay'] as String));
  }

  @override
  Future<AddEmployee?> getMaxId() async {
    return _queryAdapter.query(
        'select * from addEmployee order by id desc limit 1',
        mapper: (Map<String, Object?> row) => AddEmployee(
            row['id'] as int,
            row['joiningDate'] as String,
            row['name'] as String,
            row['desstination'] as String,
            row['number'] as String,
            row['address'] as String,
            row['basicPay'] as String));
  }

  @override
  Stream<List<AddEmployee>> streameData() {
    return _queryAdapter.queryListStream(
        'select * from addEmployee order by id desc',
        mapper: (Map<String, Object?> row) => AddEmployee(
            row['id'] as int,
            row['joiningDate'] as String,
            row['name'] as String,
            row['desstination'] as String,
            row['number'] as String,
            row['address'] as String,
            row['basicPay'] as String),
        queryableName: 'addEmployee',
        isView: false);
  }

  @override
  Future<void> deleteEmployee(int id) async {
    await _queryAdapter.queryNoReturn('delete from addEmployee where id = ?1',
        arguments: [id]);
  }

  @override
  Future<void> insertEEmployee(AddEmployee addEmployee) async {
    await _addEmployeeInsertionAdapter.insert(
        addEmployee, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateTodo(AddEmployee addEmployee) async {
    await _addEmployeeUpdateAdapter.update(
        addEmployee, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteAll(List<AddEmployee> list) {
    return _addEmployeeDeletionAdapter.deleteListAndReturnChangedRows(list);
  }
}
