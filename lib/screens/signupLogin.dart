import 'package:flutter/material.dart';
import 'package:snaprides/screens/login.dart';
import 'package:snaprides/screens/singup.dart';

class SignUpLogin extends StatefulWidget {
  @override
  _SignUpLoginState createState() => _SignUpLoginState();
}

class _SignUpLoginState extends State<SignUpLogin> {
  bool showLogin = false;

  Widget signupText() {
    return InkWell(
      onTap: () {
        setState(() {
          showLogin = false;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 2,
        ),
        child: Text(
          'Sign up',
          style: TextStyle(
            fontSize: showLogin ? 22 : 36,
            fontWeight: FontWeight.bold,
            color: showLogin ? Colors.black45 : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget loginText() {
    return InkWell(
      onTap: () {
        setState(() {
          showLogin = true;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 2,
        ),
        child: Text(
          'Log in',
          style: TextStyle(
            fontSize: showLogin ? 32 : 22,
            fontWeight: FontWeight.bold,
            color: !showLogin ? Colors.black45 : Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 40,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
              child: Container(
                height: 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    showLogin ? loginText() : signupText(),
                    Text(
                      ' / ',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.black45,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    !showLogin ? loginText() : signupText(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            showLogin ? Login() : SignUp(),
            Padding(
              padding: const EdgeInsets.only(
                left: 32,
                top: 22,
              ),
              child: Row(
                children: [
                  Text(
                    showLogin
                        ? 'New to Snaprides? '
                        : 'Already have an account? ',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: Colors.black45,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        showLogin = !showLogin;
                      });
                    },
                    child: Text(
                      showLogin ? 'Sign Up' : 'Log in',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
