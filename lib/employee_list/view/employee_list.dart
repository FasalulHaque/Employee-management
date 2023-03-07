import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../add_employee/database/Employeedatabase.dart';
import '../../add_employee/database/employeeDeo.dart';
import '../../add_employee/database/model.dart';
import '../../add_employee/view/add_employee.dart';

class EmployeeList extends StatefulWidget {
  EmployeeList({super.key});
  EmployeeDao? _employeeDao;

  List<AddEmployee> todoList = [];

  final databasee = $FloorAppDatabase.databaseBuilder('addEmployee.db').build();

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  final database = $FloorAppDatabase.databaseBuilder('todo.db').build();

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0), // here the desired height
        child: AppBar(
          shape: Border(bottom: BorderSide(color: Colors.redAccent, width: 4)),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
          ),
          flexibleSpace: Padding(
            padding: EdgeInsets.only(
                right: mediaquery.size.width * 0.55,
                top: mediaquery.size.height * 0.04),
            child: Container(
              child: Image.asset(
                'assets/image/logo1.png',
                height: 44,
                width: 44,
              ),
            ),
          ),
          title: Padding(
            padding: EdgeInsets.only(left: mediaquery.size.width * 0.09),
            child: Text('EMPLOYEE LIST',
                style: GoogleFonts.armata(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  letterSpacing: 1,
                )),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              color: Colors.black,
            )
          ],
        ),
      ),
      body: FutureBuilder(
          future: _callEmpolyee(),
          builder: (BuildContext context, AsyncSnapshot<EmployeeDao> snapshot) {
            if (!snapshot.hasData ||
                snapshot.connectionState == ConnectionState.none) {
              return const CircularProgressIndicator();
            } else {
              return StreamBuilder(
                stream: snapshot.data!.streameData(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<AddEmployee>> snapshot) {
                  if (!snapshot.hasData ||
                      snapshot.connectionState == ConnectionState.none) {
                    return const CircularProgressIndicator();
                  } else {
                    if (snapshot.data!.isEmpty) {
                      return const Center(child: Text('No Data Found'));
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            // details(mediaquery, snapshot.data![index].name,
                            //     snapshot.data![index].id.toString())

                            Padding(
                              padding: EdgeInsets.only(
                                top: mediaquery.size.height * 0.02,
                              ),
                              child: Container(
                                height: mediaquery.size.height * 0.08,
                                width: mediaquery.size.width * 0.90,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.black),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    details(
                                        mediaquery,
                                        snapshot.data![index].name,
                                        snapshot.data![index].id.toString()),
                                    PopupMenuButton(
                                        color: Colors.blueGrey.shade50,
                                        offset: const Offset(0, 56),
                                        icon: const Icon(Icons.more_horiz,
                                            color: Colors.black87),
                                        itemBuilder: (context) => [
                                              PopupMenuItem(
                                                  onTap: () {
                                                    print(
                                                        '----------------------');
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              AddEmployeeMangeScreen(
                                                            id: snapshot
                                                                .data![index]
                                                                .id,
                                                            name: snapshot
                                                                .data![index]
                                                                .name,
                                                            number: snapshot
                                                                .data![index]
                                                                .number,
                                                            desstin: snapshot
                                                                .data![index]
                                                                .desstination,
                                                            adress: snapshot
                                                                .data![index]
                                                                .address,
                                                            joinDate: snapshot
                                                                .data![index]
                                                                .joiningDate,
                                                            type: snapshot
                                                                .data![index]
                                                                .basicPay,
                                                          ),
                                                        )).then((value) {
                                                      setState(() {});
                                                    });
                                                  },
                                                  textStyle: GoogleFonts.alatsi(
                                                      color: Colors.black,
                                                      letterSpacing: 0.9),
                                                  child: GestureDetector(
                                                      onTap: () {
                                                        print(
                                                            '----------------------');
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  AddEmployeeMangeScreen(
                                                                id: snapshot
                                                                    .data![
                                                                        index]
                                                                    .id,
                                                                name: snapshot
                                                                    .data![
                                                                        index]
                                                                    .name,
                                                                number: snapshot
                                                                    .data![
                                                                        index]
                                                                    .number,
                                                                desstin: snapshot
                                                                    .data![
                                                                        index]
                                                                    .desstination,
                                                                adress: snapshot
                                                                    .data![
                                                                        index]
                                                                    .address,
                                                                joinDate: snapshot
                                                                    .data![
                                                                        index]
                                                                    .joiningDate,
                                                                type: snapshot
                                                                    .data![
                                                                        index]
                                                                    .basicPay,
                                                              ),
                                                            )).then((value) {
                                                          setState(() {});
                                                        });
                                                      },
                                                      child: Text('Update'))),
                                              PopupMenuItem(
                                                  onTap: () {
                                                    deleteTask(snapshot
                                                        .data![index].id);
                                                  },
                                                  textStyle: GoogleFonts.alatsi(
                                                      color: Colors.black,
                                                      letterSpacing: 0.9),
                                                  child: Text('Delete')),
                                            ])
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    );
                  }
                },
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          onPressed: () {},
          child: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddEmployeeMangeScreen(),
                  )).then((value) {
                setState(() {});
                print('---------------------------------');
              });
            },
            icon: const Icon(Icons.add),
          )),
    );
  }

  Row details(MediaQueryData mediaquery, String text, String text1) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: mediaquery.size.height * 0.0,
              left: mediaquery.size.width * 0.02),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.redAccent,
            child: Image.asset('assets/image/images-removebg-preview (1).png'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: mediaquery.size.height * 0.0,
              left: mediaquery.size.width * 0.02),
          child: Text(
            text,
            style: GoogleFonts.anekGujarati(
                letterSpacing: 1.2, fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: mediaquery.size.height * 0.00),
          child: Text(
            ' (ID:,$text1 SALEAS)',
            style: GoogleFonts.anekGujarati(
                letterSpacing: 1.2, fontWeight: FontWeight.w400, fontSize: 17),
          ),
        )
      ],
    );
  }

  Future<EmployeeDao> _callEmpolyee() async {
    AppDatabase appdatabase = await widget.databasee;
    widget._employeeDao = appdatabase.emplDao;
    return appdatabase.emplDao;
  }

  void deleteTask(int id) {
    widget._employeeDao!.deleteEmployee(id);
    setState(() {});
  }
}
