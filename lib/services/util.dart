import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Util {
  static ToastMSG(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black.withOpacity(0.6),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
