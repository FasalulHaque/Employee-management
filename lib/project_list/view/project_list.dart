import 'package:flutter/material.dart';
import 'package:project_1/database/database.dart';
import 'package:project_1/database/model.dart';
import 'package:project_1/database/test_deo.dart';
import 'package:project_1/project_list/view/widget.dart';
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
                //fontWeight: FontWeight.w500,
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
                        ListBox(
                          mediaquery: mediaquery,
                          text: snapshot.data![index].amount,
                        ),
                        SizedBox(
                          height: mediaquery.size.height * 0.02,
                        ),
                        // ListBox(mediaquery: mediaquery),
                        // SizedBox(
                        //   height: mediaquery.size.height * 0.02,
                        // ),
                        // ListBox(mediaquery: mediaquery),
                      ]);
                    },
                  );
                }
              },
            );
          }
        },
      ),
      //body:
      //  SingleChildScrollView(
      //   child:
      // Column(children: [
      //     SizedBox(
      //       height: mediaquery.size.height * 0.02,
      //     ),
      //     ListBox(mediaquery: mediaquery),
      //     SizedBox(
      //       height: mediaquery.size.height * 0.02,
      //     ),
      //     ListBox(mediaquery: mediaquery),
      //     SizedBox(
      //       height: mediaquery.size.height * 0.02,
      //     ),
      //     ListBox(mediaquery: mediaquery),
      //   ]),
      // ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          onPressed: () {},
          child: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddProjects(),
                  )).then((value) {
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
}
