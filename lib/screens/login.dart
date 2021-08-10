import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:snaprides/constants/constants.dart';
import 'package:snaprides/services/auth.dart';

class Login extends StatefulWidget {
  static const routeName = 'login/';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String countryDialCode = '+91';
  TextEditingController phoneController;
  bool loading = false;
  final _passwordController = TextEditingController();
  bool showPassword = false;
  final _formKey = GlobalKey<FormState>();
  void initState() {
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 55,
                  child: TextFormField(
                    initialValue: '+91',
                    enabled: false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(
                        8,
                      ),
                      labelText: 'Code',
                      labelStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Colors.black45,
                      ),
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black26,
                          width: 2.5,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black26,
                          width: 2.5,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black54,
                          width: 2.5,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    controller: phoneController,
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
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Colors.black45,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black26,
                          width: 2.5,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black54,
                          width: 2.5,
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
            TextFormField(
              controller: _passwordController,
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
                labelStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: Colors.black45,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black26,
                    width: 2.5,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black54,
                    width: 2.5,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                child: loading
                    ? Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : Text(
                        "Log In",
                        style: TextStyle(
                          color: Colors.black,
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
                      'phone': countryDialCode + phoneController.text
                    }, true, context);
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
          ],
        ),
      ),
    );
  }
}
