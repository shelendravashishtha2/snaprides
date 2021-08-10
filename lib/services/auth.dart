import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snaprides/screens/verifyOtp.dart';
import 'package:snaprides/services/userDetails.dart';

class Auth with ChangeNotifier {
  String _userId;
  bool isAuthenticated = false;
  String smsCode;
  int resendToken;
  String verificationId;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool get isAuth {
    return isAuthenticated;
  }

  String get verifyId {
    return verificationId;
  }

  String get userId {
    return _userId;
  }

  Future<User> getUser() async {
    return _auth.currentUser;
  }

  Future<bool> tryAutoLogin() async {
    User user = await getUser();
    if (user != null) {
      return true;
    } else {
      await _auth.signInAnonymously();
      return false;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    isAuthenticated = false;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    notifyListeners();
  }

  String getCurrentUID() {
    final User user = _auth.currentUser;
    final String uid = user.uid;
    return uid;
  }

  _verificationComplete(AuthCredential credential, BuildContext context) async {
    try {
      await _auth
          .signInWithCredential(credential)
          .then((UserCredential result) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        Provider.of<Auth>(context, listen: false).isAuthenticated = true;
        notifyListeners();
      });
    } on FirebaseAuthException catch (e) {
      throw e;
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      throw e;
    }
  }

  Future logInPhone(
    var userDetail,
    bool isLogin,
    BuildContext context,
  ) async {
    try {
      await _auth.verifyPhoneNumber(
        forceResendingToken: resendToken,
        phoneNumber: userDetail['phone'],
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential authCredential) async {
          await _verificationComplete(authCredential, context);
        },
        verificationFailed: (FirebaseAuthException authException) {
          print(authException.message);
          Navigator.of(context).pop();
          Fluttertoast.showToast(msg: 'Verification Failed');
        },
        codeSent: (String verifyId, [int forceResendingToken]) {
          resendToken = forceResendingToken;
          Provider.of<Auth>(context, listen: false).verificationId = verifyId;
          notifyListeners();

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => VerifyOTP(
                userDetail,
                isLogin,
              ),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationId = verificationId;
          Fluttertoast.showToast(msg: 'Timeout');
          print(verificationId);
          print("Timeout");
        },
      );
    } catch (e) {
      print(e);
    }
    return true;
  }

  verifyWithOtp(
      {String otp, Map userDetail, bool isLogin, BuildContext context}) async {
    try {
      String verificationId =
          Provider.of<Auth>(context, listen: false).verifyId;
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp);
      await _verificationComplete(credential, context);
      if (!isLogin) {
        await Provider.of<UserDetails>(context, listen: false)
            .updateUserDetails(userDetail, context);
      }
    } on FirebaseAuthException catch (e) {
      throw e;
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      throw e;
    }
  }
}
