import 'dart:io';

import 'package:flutter/material.dart';

import 'package:project_1/dashboard/pages/project_list/view/widget.dart';
import '../../add_project/database/database.dart';
import '../../add_project/database/model.dart';
import '../../add_project/database/test_deo.dart';
import '../../add_project/view/add_project.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectList extends StatefulWidget {
  ProjectList({super.key});

  TodoDao? _todoDao;
  List<Todo> todoList = [];

  final database = $FloorAppDatabase.databaseBuilder('todo.db').build();
  @override
  State<ProjectList> createState() => _ProjectListState();
}

String? button;

class _ProjectListState extends State<ProjectList> {
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        shape:
            const Border(bottom: BorderSide(color: Colors.redAccent, width: 4)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        flexibleSpace: Padding(
          padding: EdgeInsets.only(
              right: mediaquery.size.width * 0.34,
              top: mediaquery.size.height * 0.04),
          child: Image.asset(
            'assets/image/logo1.png',
            height: 44,
            width: 44,
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: mediaquery.size.width * 0.09),
          child: Text('PROJECT LIST',
              style: GoogleFonts.armata(
                fontSize: 17,
                color: Colors.black,
                letterSpacing: 1,
              )),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: Colors.black,
          )
        ],
      ),
      body: FutureBuilder(
        future: _callTodo(),
        builder: (BuildContext context, AsyncSnapshot<TodoDao> snapshot) {
          if (!snapshot.hasData ||
              snapshot.connectionState == ConnectionState.none) {
            return const CircularProgressIndicator();
          } else {
            return StreamBuilder(
              stream: snapshot.data!.streameData(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Todo>> snapshot) {
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
                      return Column(children: [
                        SizedBox(
                          height: mediaquery.size.height * 0.02,
                        ),
                        Stack(children: [
                          ListBox(
                            mediaquery: mediaquery,
                            amount: snapshot.data![index].amount,
                            pname: snapshot.data![index].projectName,
                            number: snapshot.data![index].mobile,
                            owname: snapshot.data![index].name,
                            type: snapshot.data![index].type,
                            stDate: snapshot.data![index].startDate,
                            endDate: snapshot.data![index].endDate,
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: mediaquery.size.width * 0.89),
                              child: PopupMenuButton(
                                  color: Colors.blueGrey.shade50,
                                  offset: const Offset(0, 56),
                                  icon: const Icon(Icons.more_horiz,
                                      color: Colors.black87),
                                  itemBuilder: (context) => [
                                        PopupMenuItem(
                                            onTap: () {
                                              print('----------------------');
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        AddProjects(
                                                      id: snapshot
                                                          .data![index].id,
                                                      pname: snapshot
                                                          .data![index]
                                                          .projectName,
                                                      amound: snapshot
                                                          .data![index].amount,
                                                      type: snapshot
                                                          .data![index].type,
                                                      enDate: snapshot
                                                          .data![index].endDate,
                                                      number: snapshot
                                                          .data![index].mobile,
                                                      owname: snapshot
                                                          .data![index].name,
                                                      stDate: snapshot
                                                          .data![index]
                                                          .startDate,
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
                                                            AddProjects(
                                                          id: snapshot
                                                              .data![index].id,
                                                          pname: snapshot
                                                              .data![index]
                                                              .projectName,
                                                          amound: snapshot
                                                              .data![index]
                                                              .amount,
                                                          type: snapshot
                                                              .data![index]
                                                              .type,
                                                          enDate: snapshot
                                                              .data![index]
                                                              .endDate,
                                                          number: snapshot
                                                              .data![index]
                                                              .mobile,
                                                          owname: snapshot
                                                              .data![index]
                                                              .name,
                                                          stDate: snapshot
                                                              .data![index]
                                                              .startDate,
                                                        ),
                                                      )).then((value) {
                                                    setState(() {});
                                                  });
                                                },
                                                child: const Text('Update'))),
                                        PopupMenuItem(
                                            onTap: () {
                                              deleteTask(
                                                  snapshot.data![index].id);
                                            },
                                            textStyle: GoogleFonts.alatsi(
                                                color: Colors.black,
                                                letterSpacing: 0.9),
                                            child: const Text('Delete')),
                                      ])),
                        ]),
                      ]);
                    },
                  );
                }
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          onPressed: () {},
          child: IconButton(
            onPressed: () {
              Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddProjects()))
                  .then((value) {
                setState(() {});
              });
            },
            icon: const Icon(Icons.add),
          )),
    );
  }

  Future<TodoDao> _callTodo() async {
    AppDatabase appdatabase = await widget.database;
    widget._todoDao = appdatabase.todoDeo;
    return appdatabase.todoDeo;
  }

  void deleteTask(int id) {
    widget._todoDao!.deleteTodo(id);
    setState(() {});
  }
}
