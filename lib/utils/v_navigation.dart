import 'package:energeek_test/views/history_screen.dart';
import 'package:energeek_test/views/home_screen.dart';
import 'package:flutter/material.dart';


class VNavigation {

  static toHome(context) async {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  static toHistory(context) async {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HistoryScreen()));
  }
}
