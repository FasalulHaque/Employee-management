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

  TodoDao? _todoDeoInstance;

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
            'CREATE TABLE IF NOT EXISTS `Todo` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `amount` TEXT NOT NULL, `name` TEXT NOT NULL, `mobile` TEXT NOT NULL, `type` TEXT NOT NULL, `startDate` TEXT NOT NULL, `endDate` TEXT NOT NULL, `projectName` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TodoDao get todoDeo {
    return _todoDeoInstance ??= _$TodoDao(database, changeListener);
  }
}

class _$TodoDao extends TodoDao {
  _$TodoDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _todoInsertionAdapter = InsertionAdapter(
            database,
            'Todo',
            (Todo item) => <String, Object?>{
                  'id': item.id,
                  'amount': item.amount,
                  'name': item.name,
                  'mobile': item.mobile,
                  'type': item.type,
                  'startDate': item.startDate,
                  'endDate': item.endDate,
                  'projectName': item.projectName
                },
            changeListener),
        _todoUpdateAdapter = UpdateAdapter(
            database,
            'Todo',
            ['id'],
            (Todo item) => <String, Object?>{
                  'id': item.id,
                  'amount': item.amount,
                  'name': item.name,
                  'mobile': item.mobile,
                  'type': item.type,
                  'startDate': item.startDate,
                  'endDate': item.endDate,
                  'projectName': item.projectName
                },
            changeListener),
        _todoDeletionAdapter = DeletionAdapter(
            database,
            'Todo',
            ['id'],
            (Todo item) => <String, Object?>{
                  'id': item.id,
                  'amount': item.amount,
                  'name': item.name,
                  'mobile': item.mobile,
                  'type': item.type,
                  'startDate': item.startDate,
                  'endDate': item.endDate,
                  'projectName': item.projectName
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Todo> _todoInsertionAdapter;

  final UpdateAdapter<Todo> _todoUpdateAdapter;

  final DeletionAdapter<Todo> _todoDeletionAdapter;

  @override
  Future<List<Todo>> findAllTodo() async {
    return _queryAdapter.queryList('select * from todo',
        mapper: (Map<String, Object?> row) => Todo(
            row['id'] as int,
            row['amount'] as String,
            row['name'] as String,
            row['mobile'] as String,
            row['type'] as String,
            row['startDate'] as String,
            row['endDate'] as String,
            row['projectName'] as String));
  }

  @override
  Future<Todo?> getMaxId() async {
    return _queryAdapter.query('select * from todo order by id desc limit 1',
        mapper: (Map<String, Object?> row) => Todo(
            row['id'] as int,
            row['amount'] as String,
            row['name'] as String,
            row['mobile'] as String,
            row['type'] as String,
            row['startDate'] as String,
            row['endDate'] as String,
            row['projectName'] as String));
  }

  @override
  Stream<List<Todo>> streameData() {
    return _queryAdapter.queryListStream('select * from todo order by id desc',
        mapper: (Map<String, Object?> row) => Todo(
            row['id'] as int,
            row['amount'] as String,
            row['name'] as String,
            row['mobile'] as String,
            row['type'] as String,
            row['startDate'] as String,
            row['endDate'] as String,
            row['projectName'] as String),
        queryableName: 'todo',
        isView: false);
  }

  @override
  Future<void> deleteTodo(int id) async {
    await _queryAdapter
        .queryNoReturn('delete from todo where id = ?1', arguments: [id]);
  }

  @override
  Future<void> insertTodo(Todo todo) async {
    await _todoInsertionAdapter.insert(todo, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    await _todoUpdateAdapter.update(todo, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteAll(List<Todo> list) {
    return _todoDeletionAdapter.deleteListAndReturnChangedRows(list);
  }
}
