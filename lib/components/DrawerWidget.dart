import 'package:flutter/material.dart';
import 'package:snaprides/screens/SelectCities.dart';
import 'package:snaprides/screens/signupLogin.dart';
import 'package:snaprides/services/auth.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key key,
    @required this.isAuthenticated,
    @required this.userDetails,
  }) : super(key: key);

  final bool isAuthenticated;
  final Map userDetails;

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectCity(),
                    ),
                  );
                },
                child: Text('select city'))
          ],
        ),
      ),
    );
  }
}
