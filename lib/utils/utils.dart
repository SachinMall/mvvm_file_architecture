import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvvm_file_architecture/utils/const.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode cureent, FocusNode nextFocus) {
    cureent.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message, backgroundColor: kred, textColor: kgreen);
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        forwardAnimationCurve: Curves.decelerate,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(15),
        borderRadius: BorderRadius.circular(12),
        duration: Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.BOTTOM,
        backgroundColor: kblue77D,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        icon: Icon(Icons.error, size: 28, color: Colors.white),
      )..show(context),
    );
  }

  static snakbar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text(message)));
  }
}
