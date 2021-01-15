import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:energeek_test/models/history/histories.dart';
import 'package:energeek_test/models/product/products.dart';
import 'package:energeek_test/service/api_client.dart';
import 'package:energeek_test/service/api_url.dart';
import 'package:energeek_test/utils/v_const.dart';
import 'package:energeek_test/utils/v_navigation.dart';
import 'package:energeek_test/utils/v_popup.dart';
import 'package:flutter/material.dart';

class PreviewState extends ChangeNotifier {
  BuildContext context;
  List<Products> products = List<Products>();
  bool loaded = false;
  int totalTransaction = 0;

  PreviewState(this.context, {this.products}){
    countTotalTransaction();
  }

  postTransaction() async {
    VPopUp(context).loadingPopup();
    Map<String, String> params = {};
    int i = 0;
    for(var data in products){
      if(data.qty != 0){
        params["id_produk[$i]"] = data.id.toString();
        params["qty[$i]"] = data.qty.toString();
        i++;
      }
    }
    notifyListeners();
    var response = await http
        .post(VUrl.addTransactions,
        body: params, headers: {"x-key": VConst.headerKey})
        .catchError((err) => print(err));

    try {
      var res = jsonDecode(response.body);
      Navigator.pop(context);
      if (response.statusCode == 200) {
        VNavigation.toHome(context);
      } else {
        VPopUp(context).error("Terjadi Kesalahan");
      }
    } catch (e) {
      print(e);
    }
  }

  countTotalTransaction(){
    totalTransaction = 0;
    for(var data in products){
      totalTransaction += (data.qty * data.harga);
    }
    notifyListeners();
  }
}