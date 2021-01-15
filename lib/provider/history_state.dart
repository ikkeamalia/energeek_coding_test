
import 'package:energeek_test/models/history/histories.dart';
import 'package:energeek_test/service/api_client.dart';
import 'package:energeek_test/service/api_url.dart';
import 'package:energeek_test/utils/v_const.dart';
import 'package:energeek_test/utils/v_popup.dart';
import 'package:flutter/material.dart';

class HistoryState extends ChangeNotifier {
  BuildContext context;
  List<Histories> histories = List<Histories>();
  bool loaded = false;

  HistoryState(this.context) {
    getHistoryTransaction();
  }

  getHistoryTransaction(){
    loaded = false;
    notifyListeners();
    ApiClient().get(
      url: VUrl.transactions,
      headers: {"x-key": VConst.headerKey},
      callback: (status, message, res) {
        loaded = true;
        if (status == 200) {
          histories = List<Histories>();
          histories = List<Histories>.from(res.map((i) => Histories.fromJson(i)));
        } else {
          VPopUp(context).error(message);
        }
        notifyListeners();
        return;
      },
    );
  }
}