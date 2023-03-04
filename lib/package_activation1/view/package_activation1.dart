import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../package_activation2/view/package_activation2.dart';

class PackageActivation1 extends StatelessWidget {
  const PackageActivation1({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0), // here the desired height
        child: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
          ),
          flexibleSpace: Padding(
            padding: EdgeInsets.only(
                right: mediaquery.size.width * 0.59,
                top: mediaquery.size.height * 0.04),
            child: Container(
              child: Image.asset(
                'assets/image/logo1.png',
                height: 44,
                width: 44,
              ),
              // fit: BoxFit.cover,
            ),
          ),
          shape: Border(bottom: BorderSide(color: Colors.redAccent, width: 4)),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Padding(
            padding: EdgeInsets.only(left: mediaquery.size.width * 0.05),
            child: Text('EMPLOYEE MANAGEMENT',
                style: GoogleFonts.armata(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  letterSpacing: 1,
                )),
          ),
          leadingWidth: 64,
        ),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: mediaquery.size.height * 0.09,
            ),
            const Text(
              'PACKAGE ACTIVATION',
              style: TextStyle(
                  color: Color.fromARGB(255, 41, 41, 41),
                  fontSize: 18,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: mediaquery.size.height * 0.04,
            ),
            textField(
              mediaquery,
              'Registred Email',
              const Icon(FontAwesomeIcons.mobileScreen),
            ),
            textField(
              mediaquery,
              'Activation Code',
              const Icon(Icons.key),
            ),
            SizedBox(
              height: mediaquery.size.height * 0.06,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PackageActivation2(),
                    ));
              },
              child: Container(
                padding: const EdgeInsets.all(30),
                child: Container(
                  height: mediaquery.size.height * 0.06,
                  width: mediaquery.size.width * 0.33,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 71, 70, 70),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Icon(
                    Icons.arrow_forward_sharp,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: mediaquery.size.height * 0.10,
            ),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: mediaquery.size.height * 0.03),
                  child: Container(
                    height: mediaquery.size.height * 0.10,
                    width: mediaquery.size.width * 1,
                    color: Colors.redAccent,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: mediaquery.size.width * 0.75,
                      top: mediaquery.size.height * 0.09),
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
                      left: mediaquery.size.width * 0.88,
                      top: mediaquery.size.height * 0.10),
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
          ],
        ),
      ),
    );
  }

  Padding textField(MediaQueryData mediaquery, String text, Icon icon) {
    return Padding(
      padding: EdgeInsets.only(
          top: mediaquery.size.height * 0.03,
          left: mediaquery.size.width * 0.09,
          right: mediaquery.size.width * 0.09),
      child: TextFormField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(width: 1, color: Colors.black),
            ),
            prefixIcon: icon,
            filled: true,
            hintStyle: const TextStyle(color: Colors.grey, letterSpacing: 1.3),
            hintText: text,
            fillColor: Colors.white),
      ),
    );
  }
}
