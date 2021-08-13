import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:snaprides/components/vehicleTile.dart';
import 'package:snaprides/components/citySelectButton.dart';
import 'package:snaprides/screens/timeRangeSelector.dart';
import 'package:snaprides/services/auth.dart';
import 'package:snaprides/services/userDetails.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isAuthenticated = false;
  Map userDetails;
  List timeSlots = [
    "11:00 AM",
    "12:00 PM",
    "01:00 PM",
    "02:00 PM",
    "03:00 PM",
    "04:00 PM",
    "05:00 AM",
    "06:00 PM",
    "07:00 PM",
  ];
  final format = DateFormat('MMMd');
  int _selectedStartTimeSlot = 0;
  int _selectedEndTimeSlot = 0;
  bool selectingStartDate = true;
  DateTime _selectedStartDate = DateTime.now();
  DateTime _selectedEndDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day + 1,
  );
  void initState() {
    isAuthenticated = Provider.of<Auth>(context, listen: false).isAuthenticated;
    if (isAuthenticated)
      userDetails =
          Provider.of<UserDetails>(context, listen: false).userDetails;
    super.initState();
  }

  void selectTimeRange() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return TimeRangeSelector(_selectedStartDate, _selectedEndDate,
          _selectedStartTimeSlot, _selectedEndTimeSlot);
    })).then((value) {
      if (value != null) {
        setState(() {
          _selectedStartDate = value['startDate'];
          _selectedEndDate = value['endDate'];
          _selectedStartTimeSlot = value['startTime'];
          _selectedEndTimeSlot = value['endTime'];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: Theme.of(context).accentColor,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Theme.of(context).accentColor,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),
                    CitySelectButton(
                      height: 35.0,
                      labelText: 'BENGALURU',
                      padding: 8,
                      widthRatio: 0.372,
                      suffIcon: Transform.translate(
                        offset: Offset(0, -1),
                        child: Icon(
                          FontAwesomeIcons.angleDown,
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
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        children: [
                          Text(
                            'Rent a Motorcycle',
                            style:
                                TextStyle(fontSize: 22.0, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Text(
                            'Select a Date & Time',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.grey[300]),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.0),
                              child: Text(
                                'Start Date',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey[400],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                selectTimeRange();
                              },
                              child: Container(
                                height: 45.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF161616),
                                  border:
                                      Border.all(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.calendar_today_outlined,
                                      color: Colors.grey[300],
                                      size: 14.0,
                                    ),
                                    SizedBox(
                                      width: 3.0,
                                    ),
                                    Text(
                                      '${format.format(_selectedStartDate)} - ${timeSlots[_selectedStartTimeSlot]}',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3.0,
                                    ),
                                    Icon(
                                      FontAwesomeIcons.angleDown,
                                      color: Colors.white,
                                      size: 14.0,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.0),
                              child: Text(
                                'End Date',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey[400],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                selectTimeRange();
                              },
                              child: Container(
                                height: 45.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF161616),
                                  border:
                                      Border.all(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.calendar_today_outlined,
                                      color: Colors.grey[300],
                                      size: 14.0,
                                    ),
                                    SizedBox(
                                      width: 3.0,
                                    ),
                                    Text(
                                      '${format.format(_selectedEndDate)} - ${timeSlots[_selectedEndTimeSlot]}',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3.0,
                                    ),
                                    Icon(
                                      FontAwesomeIcons.angleDown,
                                      color: Colors.white,
                                      size: 14.0,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(13.0),
                    ),
                    ListView(
                      shrinkWrap: true,
                      primary: false,
                      children: [
                        VehicleTile(
                          width: width,
                        ),
                        VehicleTile(
                          width: width,
                        ),
                        HomeInactiveContainer(
                          width: width,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
