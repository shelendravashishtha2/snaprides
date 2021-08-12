import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snaprides/components/HomePageIcon.dart';
import 'package:snaprides/constants/colorConstants.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF161616),
        body: Column(
          children: [
            Container(
              height: height / 3.5,
              color: primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Container(
                      height: height / 5.5,
                      width: width / 2.8,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(height / 35),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            "assets/images/bike.jpg",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width / 19,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "SHELENDRA",
                          style: TextStyle(
                              color: Colors.white, fontSize: height / 35),
                        ),
                        SizedBox(
                          height: 3.0,
                        ),
                        Text(
                          "Credit Balance",
                          style: TextStyle(
                              color: Colors.white, fontSize: height / 50),
                        ),
                        SizedBox(
                          height: 3.0,
                        ),
                        HomePageIcon(
                          height: 35.0,
                          labelText: 'Edit Profile',
                          padding: 8,
                          widthRatio: 0.372,
                          suffIcon: Transform.translate(
                            offset: Offset(0, -1),
                            child: Icon(
                              FontAwesomeIcons.caretRight,
                              color: Colors.white,
                              size: 15.0,
                            ),
                          ),
                          boxDecoration: BoxDecoration(
                            color: Color(0xFF161616),
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          labelStyle:
                              TextStyle(color: Colors.white, fontSize: 14.0),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF262626),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22.0),
                    topRight: Radius.circular(22.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                    top: 8.0,
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 12.0),
                        child: Container(
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.lifeRing,
                                color: Colors.grey[350],
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                "Help",
                                style: TextStyle(
                                  color: Colors.grey[350],
                                  fontSize: 18.0,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 12.0),
                        child: Container(
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.shareAlt,
                                color: Colors.grey[350],
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                "Refer & Earn",
                                style: TextStyle(
                                  color: Colors.grey[350],
                                  fontSize: 18.0,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 12.0),
                        child: Container(
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.fileAlt,
                                color: Colors.grey[350],
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                "Our Policy",
                                style: TextStyle(
                                  color: Colors.grey[350],
                                  fontSize: 18.0,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 8.0),
                        child: Container(
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.signOutAlt,
                                color: Colors.grey[350],
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                "Log Out",
                                style: TextStyle(
                                  color: Colors.grey[350],
                                  fontSize: 18.0,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
