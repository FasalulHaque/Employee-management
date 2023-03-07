import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../add_project/database/test_deo.dart';



enum SampleItem { itemOne, itemTwo, itemThree }

class ListBox extends StatelessWidget {
  ListBox(
      {super.key,
      required this.mediaquery,
      required this.amount,
      required this.pname,
      required this.number,
      required this.owname,
      required this.type,
      required this.stDate,
      required this.endDate});

  String amount;
  String pname;
  String number;
  String owname;
  String type;
  String stDate;
  String endDate;

  TodoDao? _todoDao;

  final MediaQueryData mediaquery;

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context);
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: mediaquery.size.width * 0.01,
                right: mediaquery.size.width * 0.01,
              ),
              child: Image.network(
                'https://www.stkconf.org/wp-content/uploads/2018/10/Web-Page-Background-Color.jpg',
                width: mediaquery.size.width * 1,
                //fit: BoxFit.cover,
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(left: mediaquery.size.width * 0.89),
            //   child: PopupMenuButton<SampleItem>(
            //       initialValue: selectedMenu,
            //       elevation: 0,
            //       onSelected: (SampleItem item) {
            //         setState(() {
            //           selectedMenu = item;
            //         });
            //       },
            //       itemBuilder: (BuildContext context) =>
            //           <PopupMenuEntry<SampleItem>>[
            //             PopupMenuItem<SampleItem>(
            //               onTap: () {},
            //               value: SampleItem.itemOne,
            //               textStyle: GoogleFonts.alatsi(
            //                   color: Colors.black, letterSpacing: 0.9),
            //               child: GestureDetector(
            //                   onTap: () {
            //                     showDialog(
            //                       context: context,
            //                       builder: (BuildContext context) {
            //                         return AlertDialog(
            //                           title: Text(
            //                             'Alert!!',
            //                             style: GoogleFonts.acme(),
            //                           ),
            //                           content: Text(
            //                             'Are you sure!!!!!',
            //                             style: GoogleFonts.abhayaLibre(
            //                               fontSize: 19,
            //                               fontWeight: FontWeight.w500,
            //                             ),
            //                           ),
            //                           actions: [
            //                             TextButton(
            //                               onPressed: () {
            //                                 Navigator.pop(context);
            //                               },
            //                               child: Text(
            //                                 'Cancel',
            //                                 style: GoogleFonts.aldrich(),
            //                               ),
            //                             ),
            //                             TextButton(
            //                               onPressed: () {},
            //                               child: Text(
            //                                 'Yes',
            //                                 style: GoogleFonts.aldrich(),
            //                               ),
            //                             ),
            //                           ],
            //                         );
            //                       },
            //                     );
            //                   },
            //                   child: (const Text('Delete'))),
            //             ),
            //             PopupMenuItem<SampleItem>(
            //               value: SampleItem.itemTwo,
            //               textStyle: GoogleFonts.alatsi(
            //                   color: Colors.black, letterSpacing: 0.9),
            //               child: const Text('Update'),
            //             ),
            //           ]),
            // ),
            Padding(
              padding: EdgeInsets.only(
                  left: mediaquery.size.width * 0.03,
                  top: mediaquery.size.height * 0.03,
                  bottom: mediaquery.size.height * 0.03),
              child: Container(
                  height: mediaquery.size.height * 0.21,
                  width: mediaquery.size.width * 0.44,
                  //   color: Colors.white,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(4.0, 4.0),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4.0, -4.0),
                          blurRadius: 15,
                          spreadRadius: 1.8,
                        ),
                      ]),
                  child: Padding(
                    padding:
                        EdgeInsets.only(right: mediaquery.size.width * 0.06),
                    child: Image.asset(
                      'assets/image/house-simple7.png',
                      height: mediaquery.size.height * 0.09,
                      width: mediaquery.size.width * 0.33,
                      //fit: BoxFit.cover,
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: mediaquery.size.width * 0.53,
                top: mediaquery.size.height * 0.04,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Quated',
                        style: GoogleFonts.amiko(),
                      ),
                      Text(
                        '         : $amount',
                        style: GoogleFonts.amiko(color: Colors.red),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Receaved',
                        style: GoogleFonts.amiko(),
                      ),
                      Text(
                        '     : 20000',
                        style: GoogleFonts.amiko(color: Colors.red),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Balance',
                        style: GoogleFonts.amiko(),
                      ),
                      Text(
                        '        : 20000',
                        style: GoogleFonts.amiko(color: Colors.red),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: mediaquery.size.height * 0.03,
                  ),
                  Row(
                    children: [
                      Text(
                        pname,
                        style: GoogleFonts.amiko(fontSize: 12),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Mobile : $number',
                        style: GoogleFonts.amiko(fontSize: 12),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Owner name : $owname',
                        style: GoogleFonts.amiko(fontSize: 12),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Type : $type',
                        style: GoogleFonts.amiko(fontSize: 12),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Start date : $stDate',
                        style: GoogleFonts.amiko(fontSize: 12),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Due date : $endDate',
                        style: GoogleFonts.amiko(fontSize: 12),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}

SampleItem? selectedMenu;
