import 'package:flutter/animation.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void fireToast(String name) {
    Fluttertoast.showToast(
        msg: name,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        textColor: const Color.fromARGB(255, 215, 12, 12),
        fontSize: 14.0);
  }
}
