import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_1/login_screen/view/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: mediaquery.size.height * 0.23,
                  right: mediaquery.size.width * 0.1 / 3),
              child: Text(
                'SIGN UP',
                style: GoogleFonts.almarai(
                    color: Colors.white,
                    fontSize: 29,
                    fontWeight: FontWeight.bold),
              ),
            ),
            textField(
              mediaquery,
              'Company',
              const Icon(FontAwesomeIcons.mobileScreen),
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
            textField(
              mediaquery,
              'Confirm PIN',
              const Icon(Icons.key),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
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
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: mediaquery.size.height * 0.05),
                  child: Container(
                    height: mediaquery.size.height * 0.09,
                    width: mediaquery.size.width * 1,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: mediaquery.size.width * 0.75),
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
                      left: mediaquery.size.width * 0.87,
                      top: mediaquery.size.height * 0.02),
                  child: Container(
                    height: mediaquery.size.height * 0.065,
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
