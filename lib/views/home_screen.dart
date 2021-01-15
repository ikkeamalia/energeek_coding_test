import 'package:energeek_test/models/product/products.dart';
import 'package:energeek_test/provider/home_state.dart';
import 'package:energeek_test/utils/v_color.dart';
import 'package:energeek_test/utils/v_navigation.dart';
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

    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
            itemCount: state.products.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return itemProduct(state.products[index]);
            }),
      ),
    );
  }

  bottomSection() {
    return Container();
  }

  itemProduct(Products product) {
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
                      vText(product.harga.toString(), money: true, fontSize: 13.0)
                    ])),
            Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: VInputText("0", fontSize: 13.0, keyboardType: TextInputType.number),
            ))
          ],
        ),
        Divider(height: 1, color: VColor.greyText)
      ],
    );
  }
}
