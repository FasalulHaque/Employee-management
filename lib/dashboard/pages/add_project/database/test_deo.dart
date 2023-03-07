import 'dart:ffi';

import 'package:floor/floor.dart';

import 'model.dart';

@dao
abstract class TodoDao {
  @Query('select * from todo')
  Future<List<Todo>> findAllTodo();

  @Query('select * from todo order by id desc limit 1')
  Future<Todo?> getMaxId();

  @Query('select * from todo order by id desc')
  Stream<List<Todo>> streameData();

  @insert
  Future<void> insertTodo(Todo todo);

  @update
  Future<void> updateTodo(Todo todo);

  @Query('delete from todo where id = :id')
  Future<void> deleteTodo(int id);
  @delete
  Future<int> deleteAll(List<Todo> list);
}
