import 'package:flutter/material.dart';

class ListBox extends StatelessWidget {
   ListBox({
    super.key,
    required this.mediaquery,required this.text
  });
  String text;

  final MediaQueryData mediaquery;

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context);
    return Column(
      children: [
        Container(
            height: mediaquery.size.height * 0.25,
            width: mediaquery.size.width * 0.92,
            color: const Color.fromARGB(255, 227, 220, 220),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: mediaquery.size.width * 0.05,
                    top: mediaquery.size.height * 0.04,
                    bottom: mediaquery.size.height * 0.04,
                  ),
                  child: Container(
                    height: mediaquery.size.height * 0.26,
                    width: mediaquery.size.width * 0.35,
                    color: Colors.white,
                    child: Padding(
                      padding:
                          EdgeInsets.only(right: mediaquery.size.width * 0.04),
                      child: Image.asset(
                        'assets/image/house-simple-iconhome-red-isolated-260nw-1724645506-removebg-preview.png',
                        height: mediaquery.size.height * 2,
                        width: mediaquery.size.width * 2,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: mediaquery.size.height * 0.01,
                          top: mediaquery.size.height * 0.02),
                      child: Row(
                        children:  [
                          const Text(
                            'Quated ',
                            style: TextStyle(color: Colors.black, fontSize: 19),
                          ),
                          Text(
                            '     : $text',
                            style: const TextStyle(color: Colors.red, fontSize: 19),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: mediaquery.size.height * 0.01),
                          child: const Text(
                            'Receaved ',
                            style: TextStyle(color: Colors.black, fontSize: 19),
                          ),
                        ),
                        const Text(
                          ': 10000',
                          style: TextStyle(color: Colors.red, fontSize: 19),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: mediaquery.size.height * 0.02),
                          child: const Text(
                            'Balance ',
                            style: TextStyle(color: Colors.black, fontSize: 19),
                          ),
                        ),
                        const Text(
                          '     : 10000',
                          style: TextStyle(color: Colors.red, fontSize: 19),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: mediaquery.size.width * 0.04,
                        top: mediaquery.size.height * 0.01,
                      ),
                      child: const Text(
                        'Luclde Technologles',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: mediaquery.size.width * 0.04,
                      ),
                      child: const Text(
                        'Owner name : Ubaid',
                        style: TextStyle(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: mediaquery.size.width * 0.04,
                      ),
                      child: const Text(
                        'Mobile: 999999999',
                        style: TextStyle(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: mediaquery.size.width * 0.09,
                      ),
                      child: const Text(
                        'Type : quatation',
                        style: TextStyle(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: mediaquery.size.width * 0.03,
                      ),
                      child: const Text(
                        'Start date : 10/10/2023',
                        style: TextStyle(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: mediaquery.size.width * 0.03,
                      ),
                      child: const Text(
                        'Due date: 10/10/2024',
                        style: TextStyle(),
                      ),
                    ),
                  ],
                )
              ],
            )),
      ],
    );
  }
}
