import 'dart:math';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:project_1/add_employee/view/widgets.dart';

import 'dart:io';

import '../database/Employeedatabase.dart';
import '../database/employeeDeo.dart';
import '../database/model.dart';

class AddEmployeeMangeScreen extends StatefulWidget {
  AddEmployeeMangeScreen({
    super.key,
    this.id,
    this.joinDate,
    this.name,
    this.desstin,
    this.number,
    this.adress,
    this.type,
  });
  EmployeeDao? deo;

  final TextEditingController idController = TextEditingController();
  final TextEditingController joniningController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController desstinationController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController payController = TextEditingController();
  final TextEditingController typeController = TextEditingController();

  final int? id;
  final String? type;
  final String? joinDate;
  final String? name;
  final String? desstin;
  final String? number;
  final String? adress;

  @override
  State<AddEmployeeMangeScreen> createState() => _AddEmployeeMangeScreenState();
}

class _AddEmployeeMangeScreenState extends State<AddEmployeeMangeScreen> {
  String? gander;
  bool _value = false;

  String? buttontao;

  bool idNull = true;

  @override
  void initState() {
    if (widget.id != null) {
      widget.joniningController.text = widget.joinDate!;
      widget.nameController.text = widget.name!;
      widget.desstinationController.text = widget.desstin!;
      buttontao = widget.type!;
      widget.numberController.text = widget.number!;
      widget.addressController.text = widget.adress!;
      idNull = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
          ),
          flexibleSpace: Padding(
            padding: EdgeInsets.only(
                right: media.size.width * 0.48, top: media.size.height * 0.04),
            child: Image.asset(
              'assets/image/logo1.png',
              height: 44,
              width: 44,
            ),
          ),
          shape: const Border(
              bottom: BorderSide(color: Colors.redAccent, width: 4)),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Padding(
            padding: EdgeInsets.only(left: media.size.width * 0.11),
            child: Text('ADD EMPLOYEE',
                style: GoogleFonts.armata(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  letterSpacing: 1,
                )),
          ),
          leadingWidth: 64,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: media.size.width * 0.03),
              child: GestureDetector(
                onTap: () {
                  idNull ? savee() : saveEdit();
                },
                child: Image.asset(
                    'assets/image/download3-removebg-preview (1).png'),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: media.size.height * 0.04),
            TextFelid(
              mediaQury: media,
              text: 'ID',
              icon: const Icon(Icons.key),
              controller: widget.idController,
            ),
            calendar(media, context, widget.joniningController, 'joining Date'),
            TextFelid(
              controller: widget.nameController,
              mediaQury: media,
              text: 'name',
              icon: const Icon(Icons.key),
            ),
            TextFelid(
                controller: widget.desstinationController,
                mediaQury: media,
                text: 'Desstination',
                icon: const Icon(Icons.key)),
            TextFelid(
                controller: widget.numberController,
                mediaQury: media,
                text: 'Mobile number',
                icon: const Icon(Icons.key)),
            TextFelid(
                controller: widget.addressController,
                mediaQury: media,
                text: 'Adress',
                icon: const Icon(Icons.key)),
            SizedBox(
              height: media.size.height * 0.030,
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: media.size.width * 0.50,
                  top: media.size.height * 0.01),
              child: Text('Salary',
                  style: GoogleFonts.abhayaLibre(
                      color: Colors.red,
                      fontSize: 31,
                      fontWeight: FontWeight.w300)),
            ),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: media.size.width * 0.09,
                      top: media.size.height * 0.02),
                  child: Container(
                    height: media.size.height * 0.060,
                    width: media.size.width * 0.4,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      'Basic Pay',
                      style: GoogleFonts.abel(fontSize: 22),
                    )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: media.size.width * 0.55),
                  child: ListTile(
                    title: Text(
                      'Day',
                      style: GoogleFonts.anekBangla(),
                    ),
                    leading: Radio(
                        value: 'Day',
                        groupValue: buttontao,
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => Colors.black),
                        onChanged: (String? value) {
                          setState(() {
                            buttontao = value.toString();
                          });
                        }),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: media.size.width * 0.55,
                      top: media.size.height * 0.04),
                  child: ListTile(
                    title: Text(
                      'Month',
                      style: GoogleFonts.anekBangla(),
                    ),
                    leading: Radio(
                        focusColor: Colors.black,
                        value: 'Month',
                        groupValue: buttontao,
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => Colors.black),
                        onChanged: (String? value) {
                          setState(() {
                            buttontao = value.toString();
                          });
                        }),
                  ),
                )
              ],
            ),
            SizedBox(
              height: media.size.height * 0.001,
            ),
            Padding(
              padding: EdgeInsets.only(right: media.size.width * 0.40),
              child: Container(
                height: media.size.height * 0.060,
                width: media.size.width * 0.4,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                    child: Text(
                  'Upload\n Photo',
                  style: GoogleFonts.abel(fontSize: 15),
                )),
              ),
            ),
            SizedBox(
              height: media.size.height * 0.030,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Employee Status',
                  style: GoogleFonts.anekBangla(fontSize: 23),
                ),
                Switch.adaptive(
                  value: _value,
                  activeTrackColor: Colors.redAccent,
                  activeColor: Colors.white,
                  onChanged: (newValue) => setState(() => _value = newValue),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Padding calendar(MediaQueryData media, BuildContext context,
      TextEditingController controller, String text) {
    return Padding(
      padding: EdgeInsets.only(
          top: media.size.height * 0.01,
          left: media.size.width * 0.10,
          right: media.size.width * 0.10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(width: 1, color: Colors.black),
          ),
          prefixIcon: const Icon(
            Icons.calendar_month_outlined,
            color: Colors.black,
          ),
          hintStyle: const TextStyle(color: Colors.grey, letterSpacing: 1.3),
          filled: true,
          fillColor: Colors.white,
          hintText: text,
        ),
        readOnly: true,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2030));
          if (pickedDate != null) {
            String formatDate = DateFormat("dd-MM-yyyy").format(pickedDate);
            setState(() {
              controller.text = formatDate.toString();
            });
          } else {
            print('No Selected');
          }
        },
      ),
    );
  }

  savee() {
    final databasee =
        $FloorAppDatabase.databaseBuilder('addEmployee.db').build();
    databasee.then((value) {
      value.emplDao.getMaxId().then((val) {
        int id = 1;
        if (val != null) {
          id = val.id + 1;
        }
        value.emplDao.insertEEmployee(AddEmployee(
            id,
            widget.joniningController.value.text,
            widget.nameController.value.text,
            widget.desstinationController.value.text,
            widget.numberController.value.text,
            widget.addressController.value.text,
            buttontao!));
      });
    });
    Navigator.pop(context);
  }

  saveEdit() {
    final database =
        $FloorAppDatabase.databaseBuilder('addEmployee.db').build();
    database.then((value) {
      value.emplDao.updateTodo(AddEmployee(
          widget.id!,
          widget.joniningController.value.text,
          widget.nameController.value.text,
          widget.desstinationController.value.text,
          widget.numberController.value.text,
          widget.addressController.value.text,
          buttontao!));
    });
    Navigator.pop(context);
  }
}
