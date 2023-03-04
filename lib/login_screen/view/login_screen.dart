import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../home_screen/view/home_screen.dart';
import '../../sign_up/view/sign.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/image/logo white1.png',
              height: mediaquery.size.height * 0.36,
              width: mediaquery.size.width * 0.59,
            ),
            Text(
              'SIGN IN',
              style: GoogleFonts.almarai(
                  color: Colors.white,
                  fontSize: 29,
                  fontWeight: FontWeight.bold),
            ),
            textField(
              mediaquery,
              'Mobile Number',
              const Icon(FontAwesomeIcons.mobileScreen),
            ),
            textField(
              mediaquery,
              'PIN',
              const Icon(Icons.key),
            ),
            SizedBox(
              height: mediaquery.size.height * 0.02,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ));
              },
              child: Container(
                padding: const EdgeInsets.all(30),
                child: Container(
                  height: mediaquery.size.height * 0.06,
                  width: mediaquery.size.width * 0.33,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Icon(
                    Icons.arrow_forward_sharp,
                    color: Colors.red,
                    size: 30,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: mediaquery.size.height * 0.02,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ));
                },
                child: Text(
                  'SIGN UP',
                  style: GoogleFonts.almarai(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }

  Padding textField(MediaQueryData mediaquery, String text, Icon icon) {
    return Padding(
      padding: EdgeInsets.only(
          top: mediaquery.size.height * 0.05,
          left: mediaquery.size.width * 0.09,
          right: mediaquery.size.width * 0.09),
      child: TextFormField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
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
