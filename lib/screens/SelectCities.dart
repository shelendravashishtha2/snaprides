import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectCity extends StatefulWidget {
  const SelectCity({Key key}) : super(key: key);

  @override
  _SelectCityState createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  List<Map<String, String>> cities = [
    {"img_url": "assets/images/victoria-memorial.png", "city": "Bengaluru"},
    {"img_url": "assets/images/charminar.png", "city": "Hyderabad"},
    {"img_url": "assets/images/hawa-mahal.png", "city": "Jaipur"},
    {"img_url": "assets/images/india-gate.png", "city": "Gurugram"},
    {"img_url": "assets/images/vidhana-soudha.png", "city": "Mysuru"},
    {"img_url": "assets/images/victoria-memorial.png", "city": "Pune"},
    {"img_url": "assets/images/surat.png", "city": "Udaipur"},
    {"img_url": "assets/images/jhulta-minar.png", "city": "Ahemdabad"}
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 13.0),
                            child: Text(
                              'Select your city',
                              style: TextStyle(
                                fontSize: 19.0,
                                color: Color(0xFF34517d),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: height / 3.2,
                      child: Stack(
                        children: [
                          Container(
                            height: height / 4.2,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/night.png'),
                                  fit: BoxFit.fill,
                                  alignment: Alignment.center),
                            ),
                          ),
                          Positioned(
                            top: height / 12,
                            child: Container(
                              width: width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Select Your City',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: height * 0.04,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: height / 4.2,
                            child: Container(
                              height: (height / 3.2) - (height / 4.2),
                              width: width,
                              color: Color(0xFFF6F6F6),
                              child: Transform.translate(
                                offset: Offset(width / 20, height / 25),
                                child: Text(
                                  'Telll us where you are and we make sure you #snaprides',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: height / 5.0,
                            left: width / 20,
                            child: Container(
                              color: Colors.white,
                              width: width / 1.1,
                              child: Stack(
                                children: [
                                  TextFormField(
                                    decoration: InputDecoration(
                                        labelText: "Enter City to select",
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        border: OutlineInputBorder(
                                            gapPadding: 0.0,
                                            borderSide: BorderSide.none),
                                        contentPadding: EdgeInsets.fromLTRB(
                                            20.0, 35.0, 40.0, 10.0)),
                                    keyboardType: TextInputType.emailAddress,
                                    style: GoogleFonts.varelaRound(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                  Positioned(
                                    right: 5.0,
                                    top: 16,
                                    child: Image.asset(
                                      'assets/images/india-gate.png',
                                      height: 30.0,
                                      width: 30.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: cities.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1.7),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset('${cities[index]["img_url"]}'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${cities[index]["city"]}',
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
