
import 'dart:async';

import 'package:energeek_test/utils/v_color.dart';
import 'package:energeek_test/utils/v_navigation.dart';
import 'package:energeek_test/widgets/v_text.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    goToBoarding();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(child: vText("Kasir App", color: Colors.white, fontSize: 30)),
      ),
    );
  }

  goToBoarding(){
    Timer(Duration(milliseconds: 3000), () async {
      VNavigation.toLogin(context);
    });
  }
}
