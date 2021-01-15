import 'package:energeek_test/models/product/products.dart';
import 'package:energeek_test/provider/home_state.dart';
import 'package:energeek_test/utils/v_color.dart';
import 'package:energeek_test/utils/v_navigation.dart';
import 'package:energeek_test/widgets/v_style.dart';
import 'package:energeek_test/widgets/v_text.dart';
import 'package:energeek_test/widgets/v_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeState state;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeState(context),
      child: Consumer(
        builder: (BuildContext context, HomeState state, Widget child) {
          this.state = state;
          return body();
        },
      ),
    );
  }

  body() {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
                child: vText("Aplikasi Kasir",
                    color: Colors.white, fontSize: 16.0)),
            InkWell(
                onTap: () => VNavigation.toHistory(context),
                child: Icon(Icons.history, color: Colors.white))
          ],
        ),
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
    if (!state.loaded) return VLoading();

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                  itemCount: state.products.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return itemProduct(state.products[index], index);
                  }),
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
        child: Container(
          decoration: BoxDecoration(
            color: VColor.grey500,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(child: vText("Total")),
                  vText(state.totalTransaction.toString(), money: true)
                ],
              )),
        ),
      ),
    );
  }

  itemProduct(Products product, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                flex: 5,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      vText(product.nama, fontSize: 13.0),
                      SizedBox(height: 8.0),
                      vText(product.harga.toString(),
                          money: true, fontSize: 13.0)
                    ])),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: VInputText(state.controllers[index].text,
                      controller: state.controllers[index],
                      fontSize: 13.0, keyboardType: TextInputType.number, onChange: (v){
                        state.countTotalTransaction();
                      }),
                ))
          ],
        ),
        Divider(height: 1, color: VColor.greyText)
      ],
    );
  }
}
