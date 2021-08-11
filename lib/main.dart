import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snaprides/components/BottomNav.dart';
import 'package:snaprides/screens/home.dart';
import 'package:snaprides/screens/login.dart';
import 'package:snaprides/screens/splash.dart';
import 'package:snaprides/services/auth.dart';
import 'package:snaprides/services/userDetails.dart';

import 'screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
        ChangeNotifierProvider.value(value: UserDetails()),
      ],
      child: Consumer<Auth>(
        builder: (context, auth, _) => MaterialApp(
          title: 'Snaprides',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: auth.isAuth
              ? BottomNav()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (context, snapshot) =>
                      snapshot.connectionState == ConnectionState.waiting
                          ? SplashScreen()
                          : snapshot.data == false
                              ? Login()
                              : BottomNav(),
                ),
          routes: {
            Login.routeName: (ctx) => Login(),
            HomeScreen.routeName: (ctx) => HomeScreen(),
          },
        ),
      ),
    );
  }
}
