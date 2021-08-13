import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:snaprides/components/socialButton.dart';
import 'package:snaprides/constants/constants.dart';
import 'package:snaprides/services/auth.dart';
import '../constants/constants.dart';
import 'login.dart';
import 'login.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _phoneController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loading = false;
  bool showPassword = false;
  String countryDialCode = '+91';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).accentColor,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 2,
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _nameController,
                  style: TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter name';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(
                      8,
                    ),
                    labelText: 'Name as per Aadhaar/Passport',
                    labelStyle: labelStyle,
                    enabledBorder: textFieldBorder,
                    focusedBorder: textFieldBorder,
                    errorStyle: errorStyle,
                    errorBorder: errorBorder,
                    focusedErrorBorder: errorBorder,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _phoneController,
                  style: TextStyle(color: Colors.white),
                  inputFormatters: [
                    new LengthLimitingTextInputFormatter(10),
                  ],
                  validator: (value) {
                    if (value.isEmpty || value.length != 10) {
                      return 'Please enter a valid phone number';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(
                      8,
                    ),
                    labelText: 'Phone Number as per Aadhaar',
                    labelStyle: labelStyle,
                    errorStyle: errorStyle,
                    enabledBorder: textFieldBorder,
                    focusedBorder: textFieldBorder,
                    errorBorder: errorBorder,
                    focusedErrorBorder: errorBorder,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _emailController,
                  style: TextStyle(color: Colors.white),
                  validator: (value) {
                    Pattern pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regex = new RegExp(pattern);
                    if (value.isEmpty) {
                      return 'Please enter email';
                    } else if (!(regex.hasMatch(value)))
                      return "Please enter valid email";
                    else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(
                      8,
                    ),
                    labelText: 'Email address',
                    labelStyle: labelStyle,
                    errorStyle: errorStyle,
                    enabledBorder: textFieldBorder,
                    focusedBorder: textFieldBorder,
                    errorBorder: errorBorder,
                    focusedErrorBorder: errorBorder,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordController,
                  style: TextStyle(color: Colors.white),
                  obscureText: !showPassword,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter password';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      splashRadius: 25,
                      icon: Icon(
                        showPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                    ),
                    contentPadding: EdgeInsets.all(
                      8,
                    ),
                    labelText: 'Password',
                    labelStyle: labelStyle,
                    errorStyle: errorStyle,
                    enabledBorder: textFieldBorder,
                    focusedBorder: textFieldBorder,
                    errorBorder: errorBorder,
                    focusedErrorBorder: errorBorder,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    child: _loading
                        ? Center(
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                            ),
                          ),
                    onPressed: () async {
                      if (_formKey.currentState.validate() == true) {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return loadingDialog('Sending OTP');
                            });
                        bool success =
                            await Provider.of<Auth>(context, listen: false)
                                .logInPhone({
                          'name': _nameController.text,
                          'phone': countryDialCode + _phoneController.text,
                          'email': _emailController.text,
                          'password': _passwordController.text
                        }, false, context);
                        if (!success) {
                          Navigator.of(context).pop();
                        }
                      }
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        EdgeInsets.all(
                          10,
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor,
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                SocialButton(
                  'Sign up with Google',
                  'assets/images/google.jpeg',
                  () async {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return loadingDialog('Signing In With Google');
                        });
                    try {
                      await Provider.of<Auth>(context, listen: false)
                          .signInWithGoogle(context);
                    } catch (e) {}
                    Navigator.of(context).pop();
                  },
                ),
                SocialButton(
                  'Sign up with Facebook',
                  'assets/images/facebook.png',
                  () {},
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: Colors.white70,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ),
                          );
                        },
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
