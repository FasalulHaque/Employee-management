import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_1/add_employee/add_employee.dart';

class EmployeeList extends StatelessWidget {
  const EmployeeList({super.key});

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
      body: Column(
        children: [
          SizedBox(
            height: mediaquery.size.height * 0.03,
          ),
          details(mediaquery),
          details(mediaquery),
          details(mediaquery),
          details(mediaquery)
        ],
      ),
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
                  ));
            },
            icon: const Icon(Icons.add),
          )),
    );
  }

  Row details(MediaQueryData mediaquery) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: mediaquery.size.height * 0.03,
              left: mediaquery.size.width * 0.11),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.redAccent,
            child: Image.asset('assets/image/images-removebg-preview (1).png'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: mediaquery.size.height * 0.03,
              left: mediaquery.size.width * 0.05),
          child: Text(
            'RAJU',
            style: GoogleFonts.anekGujarati(
                letterSpacing: 1.2, fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: mediaquery.size.height * 0.03),
          child: Text(
            ' (ID:01,SALEAS)',
            style: GoogleFonts.anekGujarati(
                letterSpacing: 1.2, fontWeight: FontWeight.w400, fontSize: 17),
          ),
        )
      ],
    );
  }
}
