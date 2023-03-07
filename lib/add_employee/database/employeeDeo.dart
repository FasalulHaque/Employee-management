

import 'package:floor/floor.dart';

import 'model.dart';

@dao
abstract class EmployeeDao {
  @Query('select * from addEmployee')
  Future<List<AddEmployee>> findAllEmployee();

  @Query('select * from addEmployee order by id desc limit 1')
  Future<AddEmployee?> getMaxId();

  @Query('select * from addEmployee order by id desc')
  Stream<List<AddEmployee>> streameData();

  @insert
  Future<void> insertEEmployee(AddEmployee addEmployee);

  @update
  Future<void> updateTodo(AddEmployee addEmployee);

  @Query('delete from addEmployee where id = :id')
  Future<void> deleteEmployee(int id);
  @delete
  Future<int> deleteAll(List<AddEmployee> list);
}
