import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../employee_list/view/employee_list.dart';
import '../../project_list/view/project_list.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});
  final font = GoogleFonts.alegreyaSansSc(
      fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 1);

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: mediaquery.size.height * 0.17,
                  width: mediaquery.size.width * 1,
                  color: Colors.redAccent,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: mediaquery.size.width * 0.75,
                      top: mediaquery.size.height * 0.14),
                  child: Container(
                    height: mediaquery.size.height * 0.06,
                    width: mediaquery.size.width * 0.14,
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: const Icon(
                      Icons.keyboard_arrow_up_outlined,
                      size: 50,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: mediaquery.size.height * 0.09,
                      left: mediaquery.size.width * 0.04),
                  child: const Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: mediaquery.size.height * 0.09,
                      left: mediaquery.size.width * 0.19),
                  child: const Text(
                    'EMPLOYEE MANAGEMENT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: mediaquery.size.width * 0.88,
                      top: mediaquery.size.height * 0.15),
                  child: Container(
                    height: mediaquery.size.height * 0.06,
                    width: mediaquery.size.width * 0.14,
                    decoration: const BoxDecoration(
                        color: Colors.redAccent, shape: BoxShape.circle),
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmployeeList(),
                        ));
                  },
                  child: box(
                      mediaquery,
                      Text('Employee\n     List', style: font),
                      'assets/image/images-removebg-preview.png'),
                ),
                box(mediaquery, Text('Employee\nAttandance', style: font),
                    'assets/image/attandance1.png'),
              ],
            ),
            SizedBox(
              height: mediaquery.size.height * 0.02,
            ),
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProjectList(),
                          ));
                    },
                    child: box(
                      mediaquery,
                      Text('Projects', style: font),
                      'assets/image/project1.png',
                    )),
                box(mediaquery, Text('Schedule', style: font),
                    'assets/image/schedule1.png'),
              ],
            ),
            SizedBox(
              height: mediaquery.size.height * 0.02,
            ),
            Row(
              children: [
                box(mediaquery, Text('Payments', style: font),
                    'assets/image/pat1.png'),
                box(mediaquery, Text('Recipt', style: font),
                    'assets/image/recpt1.png'),
              ],
            ),
            SizedBox(
              height: mediaquery.size.height * 0.02,
            ),
            Row(
              children: [
                box(mediaquery, Text('Expens', style: font),
                    'assets/image/Untitled-2.png'),
                box(mediaquery, Text('Reports', style: font),
                    'assets/image/recpt1.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Stack box(MediaQueryData mediaquery, Text text, String image) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: mediaquery.size.height * 0.04,
            left: mediaquery.size.width * 0.08,
          ),
          child: Container(
            height: mediaquery.size.height * 0.13,
            width: mediaquery.size.width * 0.38,
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 3.0,
                  )
                ],
                color: const Color.fromARGB(255, 244, 238, 238),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white)),
            child: Center(child: text),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: mediaquery.size.width * 0.21),
          child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.red,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 23,
                backgroundImage: AssetImage(
                  image,
                ),
              )),
        ),
      ],
    );
  }
}
