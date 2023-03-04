import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AddEmployeeMangeScreen extends StatefulWidget {
  AddEmployeeMangeScreen({super.key});

  @override
  State<AddEmployeeMangeScreen> createState() => _AddEmployeeMangeScreenState();
}

class _AddEmployeeMangeScreenState extends State<AddEmployeeMangeScreen> {
  String? gander;
  bool _value = true;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
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
                right: media.size.width * 0.53, top: media.size.height * 0.04),
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
            padding: EdgeInsets.only(left: media.size.width * 0.08),
            child: Text('ADD EMPLOYEE',
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
        child: Column(
          children: [
            SizedBox(height: media.size.height * 0.04),
            textfield(
              media,
              'ID',
              const Icon(Icons.key),
            ),
            textfield(
              media,
              'Joining Date',
              const Icon(Icons.key),
            ),
            textfield(
              media,
              'name',
              const Icon(Icons.key),
            ),
            textfield(
              media,
              'Desstination',
              const Icon(Icons.key),
            ),
            textfield(
              media,
              'Mobile number',
              const Icon(Icons.key),
            ),
            textfield(
              media,
              'Adress',
              const Icon(Icons.key),
            ),
            SizedBox(
              height: media.size.height * 0.030,
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: media.size.width * 0.50,
                  top: media.size.height * 0.01),
              child: Text('Salary',
                  style: GoogleFonts.abhayaLibre(
                      color: Colors.red,
                      fontSize: 31,
                      fontWeight: FontWeight.w300)),
            ),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: media.size.width * 0.09,
                      top: media.size.height * 0.02),
                  child: Container(
                    height: media.size.height * 0.060,
                    width: media.size.width * 0.4,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      'Basic Pay',
                      style: GoogleFonts.abel(fontSize: 22),
                    )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: media.size.width * 0.55),
                  child: ListTile(
                    title: Text(
                      'Day',
                      style: GoogleFonts.anekBangla(),
                    ),
                    leading: Radio(
                        value: 'Day',
                        groupValue: gander,
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => Colors.black),
                        onChanged: (String? value) {
                          setState(() {
                            gander = value;
                          });
                        }),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: media.size.width * 0.55,
                      top: media.size.height * 0.04),
                  child: ListTile(
                    title: Text(
                      'Month',
                      style: GoogleFonts.anekBangla(),
                    ),
                    leading: Radio(
                        focusColor: Colors.black,
                        value: 'Month',
                        groupValue: gander,
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => Colors.black),
                        onChanged: (String? value) {
                          setState(() {
                            gander = value;
                          });
                        }),
                  ),
                )
              ],
            ),
            SizedBox(
              height: media.size.height * 0.001,
            ),
            Padding(
              padding: EdgeInsets.only(right: media.size.width * 0.40),
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
            SizedBox(
              height: media.size.height * 0.030,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Employee Status',
                  style: GoogleFonts.anekBangla(fontSize: 23),
                ),
                Switch.adaptive(
                  value: _value,
                  activeTrackColor: Colors.redAccent,
                  activeColor: Colors.white,
                  onChanged: (newValue) => setState(() => _value = newValue),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Padding textfield(MediaQueryData mediaQury, String text, Icon icon) {
    return Padding(
      padding: EdgeInsets.only(
          top: mediaQury.size.height * 0.01,
          left: mediaQury.size.width * 0.10,
          right: mediaQury.size.width * 0.10),
      child: TextFormField(
        // controller: mailController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: text,
          hintStyle: TextStyle(color: Colors.grey, letterSpacing: 1.3),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: icon,
        ),
      ),
    );
  }
}
