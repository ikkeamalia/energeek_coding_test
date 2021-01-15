
import 'dart:async';

import 'package:energeek_test/utils/v_color.dart';
import 'package:energeek_test/utils/v_navigation.dart';
import 'package:energeek_test/widgets/v_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class BoardingScreen extends StatefulWidget {
  @override
  _BoardingScreenState createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {

  @override
  void initState() {
    super.initState();
    goToHome();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: VColor.azure,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(child: vText("Kasir App", color: Colors.white, fontSize: 25)),
      ),
    );
  }

  goToHome(){
    Timer(Duration(milliseconds: 2000), () async {
      VNavigation.toHome(context);
    });
  }
}
