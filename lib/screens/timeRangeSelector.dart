import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimeRangeSelector extends StatefulWidget {
  @override
  _TimeRangeSelectorState createState() => _TimeRangeSelectorState();
}

class _TimeRangeSelectorState extends State<TimeRangeSelector> {
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
  int _selectedStartTimeSlot = 0;
  int _selectedEndTimeSlot = 0;
  bool selectingStartDate = true;
  DateTime _selectedStartDate = DateTime.now();
  DateTime _selectedEndDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day + 1,
  );

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.0),
                          child: Text(
                            'Start Date',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          height: 45.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF161616),
                            border: Border.all(color: Colors.grey, width: 1),
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
                                '10 Aug - 04:00 pm',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.0),
                          child: Text(
                            'End Date',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          height: 45.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF161616),
                            border: Border.all(color: Colors.grey, width: 1),
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
                                '10 Aug - 04:00 pm',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              CalendarDatePicker(
                initialDate:
                    selectingStartDate ? _selectedStartDate : _selectedEndDate,
                firstDate: DateTime.now(),
                lastDate: DateTime(
                  DateTime.now().year,
                  DateTime.now().month + 1,
                  DateTime.now().day,
                ),
                onDateChanged: (v) {},
              ),
              Container(
                height: 2,
                color: Colors.grey,
              ),
              timeSlotsList(timeSlots),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  actionButton('CANCEL', Icons.cancel_outlined, () {
                    Navigator.of(context).pop();
                  }),
                  Container(
                    width: 1,
                    color: Colors.white,
                  ),
                  actionButton(selectingStartDate ? 'NEXT' : 'DONE', Icons.done,
                      () {
                    if (!selectingStartDate) {
                      Navigator.of(context).pop();
                    }
                    if (selectingStartDate)
                      setState(() {
                        selectingStartDate = false;
                      });
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget timeSlotsList(List timeSlots) {
    return Expanded(
      child: ListView.builder(
          itemCount: timeSlots.length,
          itemBuilder: (context, i) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectingStartDate
                      ? _selectedStartTimeSlot = i
                      : _selectedEndTimeSlot = i;
                });
              },
              child: Container(
                color: (selectingStartDate && _selectedStartTimeSlot == i) ||
                        (!selectingStartDate && _selectedEndTimeSlot == i)
                    ? Colors.grey[300]
                    : Colors.white,
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Center(
                  child: Text(
                    timeSlots[i],
                    style: TextStyle(
                        fontSize: (selectingStartDate &&
                                    _selectedStartTimeSlot == i) ||
                                (!selectingStartDate &&
                                    _selectedEndTimeSlot == i)
                            ? 22
                            : 18,
                        color: (selectingStartDate &&
                                    _selectedStartTimeSlot == i) ||
                                (!selectingStartDate &&
                                    _selectedEndTimeSlot == i)
                            ? Colors.black
                            : Colors.grey),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget actionButton(String title, IconData icon, Function fun) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
      ),
      width: width / 2 - 0.5,
      padding: EdgeInsets.all(
        8,
      ),
      child: TextButton(
        onPressed: fun,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 22,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
