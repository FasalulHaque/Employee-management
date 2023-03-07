import 'dart:io';

import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:project_1/dashboard/pages/add_project/view/widget.dart';

import '../database/database.dart';
import '../database/model.dart';

class AddProjects extends StatefulWidget {
  AddProjects(
      {super.key,
      this.id,
      this.pname,
      this.owname,
      this.number,
      this.type,
      this.stDate,
      this.enDate,
      this.amound});

  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController _stDateController = TextEditingController();
  final TextEditingController _endDataController = TextEditingController();
  final TextEditingController _projectNameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  late final Function(File) onImageSelected;

  final int? id;
  final String? pname;
  final String? owname;
  final String? number;
  final String? type;
  final String? stDate;
  final String? enDate;
  final String? amound;

  @override
  State<AddProjects> createState() => _AddProjectsState();
}

String? vauuu;
late final Function(File) onImageSelected;

class _AddProjectsState extends State<AddProjects> {
  String? imagePath;
  bool _value = false;
  String? buttontao;

  bool idNull = true;

  @override
  void initState() {
    if (widget.id != null) {
      widget._amountController.text = widget.amound!;
      widget._projectNameController.text = widget.pname!;
      widget._mobileController.text = widget.number!;
      widget._nameController.text = widget.owname!;
      buttontao = widget.type!;
      widget._stDateController.text = widget.stDate!;
      widget._endDataController.text = widget.enDate!;
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
            child: Text('ADD PROJECT',
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
              child: Image.asset(
                  'assets/image/download3-removebg-preview (1).png'),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: media.size.height * 0.03,
          ),
          textfield(
              mediaQury: media,
              text: 'ID',
              icon: const Icon(Icons.person_pin_outlined),
              controller: widget._idController),
          textfield(
              mediaQury: media,
              text: 'Project Name',
              icon: const Icon(Icons.file_copy_outlined),
              controller: widget._projectNameController),
          textfield(
              mediaQury: media,
              text: 'Ower Name',
              icon: const Icon(Icons.person_2_outlined),
              controller: widget._nameController),
          textfield(
              mediaQury: media,
              text: 'Contact No',
              icon: const Icon(FontAwesomeIcons.mobileScreen),
              controller: widget._mobileController),
          calendar(media, context, widget._stDateController, 'Enter Date'),
          calendar(media, context, widget._endDataController, 'End Date'),
          textfield(
              mediaQury: media,
              text: 'Quated Amount',
              icon: const Icon(Icons.currency_rupee),
              controller: widget._amountController),
          Padding(
            padding: EdgeInsets.only(
                right: media.size.width * 0.39, top: media.size.height * 0.02),
            child: GestureDetector(
              // onTap: pickAndSaveImage,
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
          ),
          Padding(
            padding: EdgeInsets.only(
                top: media.size.height * 0.03, left: media.size.width * 0.15),
            child: Text('Projects type',
                style: GoogleFonts.abhayaLibre(
                    color: Colors.red,
                    fontSize: 28,
                    fontWeight: FontWeight.w300)),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: media.size.width * 0.44, top: media.size.height * 0.01),
            child: ListTile(
              title: Text(
                'Quatation',
                style: GoogleFonts.anekBangla(),
              ),
              leading: Radio(
                  value: 'Quatation',
                  groupValue: buttontao,
                  fillColor:
                      MaterialStateColor.resolveWith((states) => Colors.black),
                  onChanged: (String? value) {
                    setState(() {
                      buttontao = value.toString();
                    });
                  }),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: media.size.width * 0.44),
            child: ListTile(
              title: Text(
                'Dialy wage',
                style: GoogleFonts.anekBangla(),
              ),
              leading: Radio(
                  value: 'Dialy Wage',
                  groupValue: buttontao,
                  fillColor:
                      MaterialStateColor.resolveWith((states) => Colors.black),
                  onChanged: (String? value) {
                    setState(() {
                      buttontao = value.toString();
                    });
                  }),
            ),
          ),
          SizedBox(
            height: media.size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'PROJECT Status',
                style: GoogleFonts.anekBangla(fontSize: 23),
              ),
              GestureDetector(
                onTap: () {
                  idNull ? _save() : saveEdit();
                },
                child: Switch.adaptive(
                  value: _value,
                  activeTrackColor: Colors.redAccent,
                  activeColor: Colors.white,
                  onChanged: (newValue) =>
                      setState(() => _value = idNull ? _save() : saveEdit()),
                ),
              ),
            ],
          ),
        ]),
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

  _save() {
    final database = $FloorAppDatabase.databaseBuilder('todo.db').build();
    database.then((value) {
      value.todoDeo.getMaxId().then((val) {
        int id = 1;
        if (val != null) {
          id = val.id + 1;
        }
        value.todoDeo.insertTodo(Todo(
          id,
          widget._amountController.value.text,
          widget._nameController.value.text,
          widget._mobileController.value.text,
          buttontao!,
          widget._stDateController.value.text,
          widget._endDataController.value.text,
          widget._projectNameController.value.text,
        ));
      });
    });
    Navigator.pop(context);
  }

  saveEdit() {
    final database = $FloorAppDatabase.databaseBuilder('todo.db').build();
    database.then((value) {
      value.todoDeo.updateTodo(Todo(
        widget.id!,
        widget._amountController.value.text,
        widget._nameController.value.text,
        widget._mobileController.value.text,
        buttontao!,
        widget._stDateController.value.text,
        widget._endDataController.value.text,
        widget._projectNameController.value.text,
      ));
    });
    Navigator.pop(context);
  }
}
