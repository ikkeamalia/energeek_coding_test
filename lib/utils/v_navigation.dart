import 'package:energeek_test/models/product/products.dart';
import 'package:energeek_test/views/login_screen.dart';
import 'package:energeek_test/views/detail_history_screen.dart';
import 'package:energeek_test/views/history_screen.dart';
import 'package:energeek_test/views/home_screen.dart';
import 'package:energeek_test/views/preview_screen.dart';
import 'package:flutter/material.dart';


class VNavigation {

  static toHome(context) async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
  }

  static toHistory(context) async {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HistoryScreen()));
  }

  static toHistoryDetail(context, int historyId) async {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => DetailHistoryScreen(historyId)));
  }

  static toPreview(context, List<Products> products) async {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => PreviewScreen(products)));
  }

  static toLogin(context) async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
  }
}
