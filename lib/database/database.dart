import 'package:path/path.dart';
import 'package:project_1/database/model.dart';
import 'package:project_1/database/test_deo.dart';
import 'package:sqflite/sqflite.dart' as sqflite ;
import 'dart:async';

import 'package:floor/floor.dart';


part 'database.g.dart';

@Database(version: 1, entities: [Todo])
abstract class AppDatabase extends FloorDatabase {
  TodoDao get todoDeo;
}
