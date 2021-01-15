
import 'package:energeek_test/models/history/detail_histories.dart';
import 'package:energeek_test/provider/history_detail_state.dart';
import 'package:energeek_test/utils/v_color.dart';
import 'package:energeek_test/widgets/v_text.dart';
import 'package:energeek_test/widgets/v_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailHistoryScreen extends StatefulWidget {
  final int historyId;
  DetailHistoryScreen(this.historyId);

  @override
  _DetailHistoryScreenState createState() => _DetailHistoryScreenState();
}

class _DetailHistoryScreenState extends State<DetailHistoryScreen> {
  HistoryDetailState state;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HistoryDetailState(context, historyId: widget.historyId),
      child: Consumer(
        builder: (BuildContext context, HistoryDetailState state,
            Widget child) {
          this.state = state;
          return body();
        },
      ),
    );
  }

  body() {
    return Scaffold(
      appBar: AppBar(
        title: vText("Detail Transaksi",
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
        child: Column(
          children: [
            ListView.builder(
                itemCount: state.detailHistories.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return itemHistory(state.detailHistories[index]);
                }),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(child: vText(("TOTAL"), fontSize: 13.0)),
                  vText(state.totalTransaction.toString(), money: true, fontSize: 13.0)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  itemHistory(DetailHistories data){
    return Column(
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
                  flex: 5,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        vText(data.nama, fontSize: 13.0),
                        SizedBox(height: 8.0),
                        vText(("${data.qty} x ${data.harga}"), fontSize: 13.0)
                      ])),
              Expanded(flex: 1,
                  child: vText((data.harga * data.qty).toString(), money: true, fontSize: 13.0))
            ],
          ),
        ),
        Divider(height: 1, color: VColor.greyText)
      ],
    );
  }

}
