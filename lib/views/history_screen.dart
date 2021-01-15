
import 'package:energeek_test/models/history/histories.dart';
import 'package:energeek_test/provider/history_state.dart';
import 'package:energeek_test/utils/date_utils.dart';
import 'package:energeek_test/utils/v_color.dart';
import 'package:energeek_test/utils/v_navigation.dart';
import 'package:energeek_test/widgets/v_text.dart';
import 'package:energeek_test/widgets/v_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  HistoryState state;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HistoryState(context),
      child: Consumer(
        builder: (BuildContext context, HistoryState state, Widget child) {
          this.state = state;
          return body();
        },
      ),
    );
  }

  body() {
    return Scaffold(
      appBar: AppBar(
        title: vText("Riwayat Transaksi",
            color: Colors.white, fontSize: 16.0),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: upperSection(),
      ),
    );
  }

  upperSection() {
    if (!state.loaded) return VLoading();

    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
            itemCount: state.histories.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return itemHistory(state.histories[index]);
            }),
      ),
    );
  }

  itemHistory(Histories data){
    return InkWell(
      onTap: () => VNavigation.toHistoryDetail(context, data.id),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: vText(data.tanggal, fontSize: 13.0)),
                vText(data.harga.toString(), fontSize: 13.0, money: true)
              ],
            ),
          ),
          Divider(height: 1, color: VColor.greyText)
        ],
      ),
    );
  }
}
