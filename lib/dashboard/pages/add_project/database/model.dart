import 'dart:io';
import 'dart:typed_data';

import 'package:floor/floor.dart';
import 'package:image_picker/image_picker.dart';

@entity
class Todo {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final String amount;
  final String name;
  final String mobile;
  final String type;
  final String startDate;
  final String endDate;
  final String projectName;
  //final XFile image;
  //final String? image;

  @ignore
  bool isSelect = false;
  Todo(this.id,this.amount, this.name, this.mobile, this.type,this.startDate,this.endDate,this.projectName,);
}