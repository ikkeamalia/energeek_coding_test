
import 'package:energeek_test/models/history/detail_histories.dart';
import 'package:energeek_test/models/history/histories.dart';
import 'package:energeek_test/service/api_client.dart';
import 'package:energeek_test/service/api_url.dart';
import 'package:energeek_test/utils/v_const.dart';
import 'package:energeek_test/utils/v_popup.dart';
import 'package:flutter/material.dart';

class HistoryDetailState extends ChangeNotifier {
  BuildContext context;
  List<DetailHistories> detailHistories = List<DetailHistories>();
  bool loaded = false;
  int historyId;
  int totalTransaction = 0;

  HistoryDetailState(this.context, {this.historyId}) {
    getDetailHistoryTransaction();
  }

  getDetailHistoryTransaction(){
    loaded = false;
    notifyListeners();
    ApiClient().get(
      url: VUrl.transactionDetail+"$historyId",
      headers: {"x-key": VConst.headerKey},
      callback: (status, message, res) {
        loaded = true;
        if (status == 200) {
          detailHistories = List<DetailHistories>();
          detailHistories = List<DetailHistories>.from(res.map((i) => DetailHistories.fromJson(i)));
          countTotal();
        } else {
          VPopUp(context).error(message);
        }
        notifyListeners();
        return;
      },
    );
  }

  countTotal(){
    totalTransaction = 0;
    for(var data in detailHistories){
      totalTransaction += (data.qty * data.harga);
    }
  }
}