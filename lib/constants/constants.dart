import 'package:flutter/material.dart';

Widget loadingDialog(String title) {
  return Dialog(
    insetPadding: EdgeInsets.all(20),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: new Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          new CircularProgressIndicator(),
          SizedBox(
            width: 10,
          ),
          new Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget invalidOtpDialog(BuildContext context) {
  return AlertDialog(
    title: Text('Invalid OTP'),
    content: Text('Please enter a valid sent OTP sent on your phone number.'),
    actions: [
      TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Okay'))
    ],
  );
}
