import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../package_activation1/view/package_activation1.dart';
import '../../package_activation2/view/package_activation2.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('EMPLOYEE MANAGEMENT',
            style: GoogleFonts.armata(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              letterSpacing: 1.3,
            )),
        leading: Padding(
          padding: EdgeInsets.only(left: mediaquery.size.width * 0.07),
          child: Image.asset('assets/image/logo1.png', fit: BoxFit.cover),
        ),
        leadingWidth: 64,
      ),
      body: Column(
        children: [
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PackageActivation1(),
                    ));
              },
              child: boxContainer(mediaquery)),
          boxContainer(mediaquery),
          boxContainer(mediaquery),
          boxContainer(mediaquery),
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
    );
  }

  Padding boxContainer(MediaQueryData mediaquery) {
    return Padding(
      padding: EdgeInsets.only(
        left: mediaquery.size.width * 0.12,
        right: mediaquery.size.width * 0.12,
        top: mediaquery.size.height * 0.04,
      ),
      child: Container(
        height: mediaquery.size.height * 0.14,
        width: mediaquery.size.width * 0.99,
        color: const Color.fromARGB(255, 68, 68, 68),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: mediaquery.size.height * 0.03,
              ),
              child: const Text(
                'Trial',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 22,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: mediaquery.size.height * 0.02,
              ),
              child: const Text(
                '10 Days Trial Version',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
