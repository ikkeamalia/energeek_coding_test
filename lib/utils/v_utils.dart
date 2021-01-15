import 'dart:convert';

import 'package:energeek_test/utils/v_color.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VUtils{
  static String getPrettyJSONString(jsonObject) {
    var encoder = new JsonEncoder.withIndent("     ");
    return encoder.convert(jsonObject);
  }

  static void toast(message, context, {duration}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: duration ?? Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: VColor.black300.withOpacity(0.5),
      timeInSecForIosWeb: 1,
    );
  }
}