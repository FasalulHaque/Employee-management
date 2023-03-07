import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

import 'package:floor/floor.dart';

import 'employeeDeo.dart';
import 'model.dart';

part 'Employeedatabase.g.dart';

@Database(version: 1, entities: [AddEmployee])
abstract class AppDatabase extends FloorDatabase {
  EmployeeDao get emplDao;
}
