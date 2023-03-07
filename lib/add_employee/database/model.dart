import 'package:floor/floor.dart';

@entity
class AddEmployee {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final String joiningDate;
  final String name;
  final String desstination;
  final String number;
  final String address;
  final String basicPay;

  @ignore
  bool isSelect = false;
  AddEmployee(
    this.id,
    this.joiningDate,
    this.name,
    this.desstination,
    this.number,
    this.address,
    this.basicPay,
  );
}
