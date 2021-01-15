import 'dart:convert';

import 'package:energeek_test/models/product/products.dart';
import 'package:energeek_test/service/api_client.dart';
import 'package:energeek_test/service/api_url.dart';
import 'package:energeek_test/utils/v_const.dart';
import 'package:energeek_test/utils/v_popup.dart';
import 'package:flutter/material.dart';

class HomeState extends ChangeNotifier {
  BuildContext context;
  List<Products> products = List<Products>();
  bool loaded = false;
  List<TextEditingController> controllers = List<TextEditingController>();
  int totalTransaction = 0;

  HomeState(this.context){
    getProducts();
  }

  getProducts() async {
    loaded = false;
    notifyListeners();
    ApiClient().get(
      url: VUrl.products,
      headers: {"x-key": VConst.headerKey},
      callback: (status, message, res) {
        loaded = true;
        if (status == 200) {
          products = List<Products>();
          products = List<Products>.from(res.map((i) => Products.fromJson(i)));
          initializeController();
        } else {
          VPopUp(context).error(message);
        }
        notifyListeners();
        return;
      },
    );
  }

  initializeController(){
    controllers = List<TextEditingController>();
    for(var data in products){
      TextEditingController controller = TextEditingController();
      controller.text = "0";
      controllers.add(controller);
    }
  }

  countTotalTransaction(){
    totalTransaction = 0;
    for(int i=0; i<products.length; i++){
      totalTransaction += (products[i].harga * int.parse(controllers[i].text.toString()));
    }
    notifyListeners();
  }
}
