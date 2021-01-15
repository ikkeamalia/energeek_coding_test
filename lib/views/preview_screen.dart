
import 'package:energeek_test/models/product/products.dart';
import 'package:energeek_test/provider/preview_state.dart';
import 'package:energeek_test/utils/v_color.dart';
import 'package:energeek_test/widgets/v_style.dart';
import 'package:energeek_test/widgets/v_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PreviewScreen extends StatefulWidget {
  final List<Products> products;
  PreviewScreen(this.products);

  @override
  _PreviewScreenState createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  PreviewState state;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PreviewState(context, products: widget.products),
      child: Consumer(
        builder: (BuildContext context, PreviewState state, Widget child) {
          this.state = state;
          return body();
        },
      ),
    );
  }

  body() {
    return Scaffold(
      appBar: AppBar(
        title: vText("Konfirmasi",
            color: Colors.white, fontSize: 16.0),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [upperSection(), bottomSection()],
        ),
      ),
    );
  }

  upperSection() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                ListView.builder(
                    itemCount: state.products.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return itemProduct(state.products[index], index);
                    }),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 20.0, 15.0, 10.0),
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
          SizedBox(height: 20)
        ],
      ),
    );
  }

  bottomSection() {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(VStyle.itemCorner),
          ),
        ),
        child: InkWell(
          onTap: () {
            state.postTransaction();
          },
          child: Container(
            decoration: BoxDecoration(
              color: VColor.grey500,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child:Center(child: vText("Selesai")),
          ),
        ),
      ),
    ));
  }

  itemProduct(Products data, int index) {
    return data.qty !=0 ? Column(
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
                  flex: 4,
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
    ) : Container();
  }
}
