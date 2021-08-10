import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:snaprides/constants/constants.dart';
import 'package:snaprides/screens/home.dart';
import 'package:snaprides/services/auth.dart';

class VerifyOTP extends StatefulWidget {
  static const routeName = 'verify-otp/';
  final Map userDetails;
  final bool isLogin;
  VerifyOTP(
    this.userDetails,
    this.isLogin,
  );
  @override
  _VerifyOTPState createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  bool loading = false;
  String code = '';

  void initState() {
    super.initState();
  }

  Future<void> verify() async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return loadingDialog('Verifying OTP...');
        });

    try {
      await Provider.of<Auth>(context, listen: false).verifyWithOtp(
        otp: code,
        isLogin: widget.isLogin,
        userDetail: widget.userDetails,
        context: context,
      );
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    } catch (e) {
      Navigator.of(context).pop();
      showDialog(
        context: context,
        builder: (BuildContext context) => invalidOtpDialog(context),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                  ),
                ),
                child: Hero(
                  tag: 'login-header',
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 60,
                      child: Icon(
                        Icons.lock,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                padding: const EdgeInsets.all(12.0),
                width: MediaQuery.of(context).size.height,
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Enter OTP",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "OTP sent to ${widget.userDetails['phone']}",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 16,
                          ),
                          child: PinCodeTextField(
                            appContext: context,
                            pastedTextStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            length: 6,
                            obscureText: false,
                            blinkWhenObscuring: true,
                            animationType: AnimationType.fade,
                            onChanged: (v) {
                              setState(() {
                                code = v;
                              });
                            },
                            pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(5),
                                fieldHeight: 50,
                                fieldWidth: 40,
                                inactiveFillColor: Colors.grey[200],
                                inactiveColor: Colors.grey[600],
                                activeFillColor: Colors.white,
                                selectedFillColor: Colors.white,
                                selectedColor: Theme.of(context).primaryColor),
                            cursorColor: Colors.black,
                            animationDuration: Duration(milliseconds: 300),
                            enableActiveFill: true,
                            keyboardType: TextInputType.number,
                            boxShadows: [
                              BoxShadow(
                                offset: Offset(0, 1),
                                color: Colors.black12,
                                blurRadius: 10,
                              )
                            ],
                            onCompleted: (value) async {
                              if (value != null && value.length == 6) {
                                await verify();
                              }
                            },
                          )),
                    ],
                  ),
                ),
              ),
              // roundedRectButton("Submit", context, () async {
              //   if (code != null && code.length == 6) await verify();
              // }),
            ],
          ),
        ),
      ),
    );
  }
}
