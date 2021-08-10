import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:snaprides/services/auth.dart';

class UserDetails with ChangeNotifier {
  var _userDetails;
  final databaseReference = FirebaseFirestore.instance;

  Map get userDetails {
    return _userDetails;
  }

  Future updateUserDetails(var userDetails, BuildContext context) async {
    String uid = Provider.of<Auth>(context, listen: false).getCurrentUID();

    await databaseReference
        .collection('phone')
        .doc(userDetails['phone'])
        .set({});
    await databaseReference.collection("userDetails").doc(uid).set(userDetails);
    _userDetails = userDetails;
    notifyListeners();
    return userDetails;
  }
}
