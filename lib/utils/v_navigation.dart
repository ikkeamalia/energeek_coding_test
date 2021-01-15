import 'package:energeek_test/models/product/products.dart';
import 'package:energeek_test/views/detail_history_screen.dart';
import 'package:energeek_test/views/history_screen.dart';
import 'package:energeek_test/views/home_screen.dart';
import 'package:energeek_test/views/preview_screen.dart';
import 'package:flutter/material.dart';


class VNavigation {

  static toHome(context) async {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomeScreen()),
            (Route<dynamic> route) => false);
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
}
