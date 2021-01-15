import 'package:energeek_test/utils/v_color.dart';
import 'package:energeek_test/utils/v_navigation.dart';
import 'package:energeek_test/widgets/v_text.dart';
import 'package:flutter/material.dart';

class SaveTransactionSuccessPopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 200.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            vText(
                "Berhasil", fontWeight: FontWeight.bold, fontSize: 25.0, color: VColor.black300),
            SizedBox(height: 10),
            vText(
                "Transaksi berhasil dibuat", fontSize: 14.0, color: VColor.black300),
            SizedBox(height: 30),
            Container(width: 70, child: vButton(title: "Ok", textSize: 15.0, color: VColor.emerald, onTap: (){
              VNavigation.toHome(context);
            }))
          ],
        ),
      ),
    );
  }
}

