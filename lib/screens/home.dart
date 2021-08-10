import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snaprides/screens/login.dart';
import 'package:snaprides/screens/signupLogin.dart';
import 'package:snaprides/services/auth.dart';
import 'package:snaprides/services/userDetails.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isAuthenticated = false;
  Map userDetails;
  void initState() {
    isAuthenticated = Provider.of<Auth>(context, listen: false).isAuthenticated;
    if (isAuthenticated)
      userDetails =
          Provider.of<UserDetails>(context, listen: false).userDetails;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              if (!isAuthenticated)
                ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return SignUpLogin();
                    }));
                  },
                  contentPadding: EdgeInsets.all(
                    12,
                  ),
                  leading: CircleAvatar(
                    radius: 50,
                    child: Icon(
                      Icons.person,
                      size: 30,
                    ),
                  ),
                  title: Text(
                    'Login Or Signup',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              else
                ListTile(
                  onTap: () {},
                  contentPadding: EdgeInsets.all(
                    12,
                  ),
                  leading: CircleAvatar(
                    radius: 50,
                    child: Icon(
                      Icons.person,
                      size: 30,
                    ),
                  ),
                  title: Text(
                    userDetails['name'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              if (isAuthenticated)
                IconButton(
                    icon: Icon(Icons.logout),
                    onPressed: () async {
                      await Auth().logout();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => SignUpLogin(),
                        ),
                      );
                    }),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Home'),
        actions: [],
      ),
      body: Container(
        padding: EdgeInsets.all(
          6,
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Search Your Ride',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Pickup',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 45,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Material(
                              elevation: 5,
                              color: Colors.white,
                              shadowColor: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    8,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(
                                  8,
                                ),
                                child: TextFormField(
                                  enabled: false,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'Select Date',
                                    prefixIcon: Icon(
                                      Icons.calendar_today,
                                    ),
                                    labelStyle: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 45,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Material(
                              elevation: 5,
                              color: Colors.white,
                              shadowColor: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    8,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(
                                  8,
                                ),
                                child: TextFormField(
                                  enabled: false,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'Select Time',
                                    prefixIcon: Icon(
                                      Icons.access_time,
                                    ),
                                    labelStyle: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Drop Off',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 45,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Material(
                              elevation: 5,
                              color: Colors.white,
                              shadowColor: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    8,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(
                                  8,
                                ),
                                child: TextFormField(
                                  enabled: false,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'Select Date',
                                    prefixIcon: Icon(
                                      Icons.calendar_today,
                                    ),
                                    labelStyle: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 45,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Material(
                              elevation: 5,
                              color: Colors.white,
                              shadowColor: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    8,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(
                                  8,
                                ),
                                child: TextFormField(
                                  enabled: false,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'Select Time',
                                    prefixIcon: Icon(
                                      Icons.access_time,
                                    ),
                                    labelStyle: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // Center(
                      //     child: roundedRectButton('Search', context, () {})),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
