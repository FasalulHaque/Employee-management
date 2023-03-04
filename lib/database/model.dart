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
  // XFile image;
  @ignore
  bool isSelect = false;
  Todo(this.id,this.amount, this.name, this.mobile, this.type,this.startDate,this.endDate,this.projectName,);
}





// import 'package:floor/floor.dart';

// @entity
// class Test {
//   @PrimaryKey(autoGenerate: true)
//   final int id;
//   final String amount;
//   final String name;
//   final String mobile;
//   //final String type;
//   final String startDate;
//   final String endDate;
//   final String projectName;

//   @ignore
//   bool isSelect = false;
//   Test(this.id, this.name, this.mobile, this.endDate, this.startDate,
//       this.projectName, this.amount);
// }
