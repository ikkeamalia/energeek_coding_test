
import 'dart:async';

import 'package:energeek_test/utils/v_color.dart';
import 'package:energeek_test/utils/v_navigation.dart';
import 'package:energeek_test/utils/v_utils.dart';
import 'package:energeek_test/widgets/v_text.dart';
import 'package:energeek_test/widgets/v_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(child:
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            vText("Kasir App", color: Colors.white, fontSize: 30.0),
            SizedBox(height: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VInputText("Username", controller: username),
                SizedBox(height: 2.0),
                vText(" username: test01", fontSize: 11.0, color: Colors.white),
                SizedBox(height: 20.0),
                VInputText("Password", controller: password, keyboardType: TextInputType.number),
                SizedBox(height: 2.0),
                vText(" pass: 1234", fontSize: 11.0, color: Colors.white),
              ],
            ),
            SizedBox(height: 30.0),
            vButton(title: "Login", color: VColor.emerald, onTap: (){
              if(username.text.toString() == "test01" && password.text.toString() == "1234"){
                goToHome();
              } else{
                VUtils.toast("Username or password invalid", context);
              }
            })
          ],
        ),
      )),
    );
  }

  goToHome(){
    VNavigation.toHome(context);
  }
}
