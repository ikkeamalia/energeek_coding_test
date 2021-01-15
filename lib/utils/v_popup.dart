import 'package:energeek_test/widgets/v_text.dart';
import 'package:energeek_test/widgets/v_widget.dart';
import 'package:flutter/material.dart';

class VPopUp {
  final BuildContext context;
  String title;
  String content;

  VPopUp(this.context, {title, content});

  void loadingPopup() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (c) => Center(child: VLoading()),
    );
  }

  void error(message, {title = "Maaf", onPressed}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (c) => AlertDialog(
          title: vText(title, color: Colors.red),
          content: vText(message),
          actions: <Widget>[
            FlatButton(
              child: vText("OK"),
              onPressed: () {
                Navigator.pop(context);
                onPressed();
              },
            )
          ],
        ));
  }

  Future<bool> alert(content) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (c) {
        return AlertDialog(
          title: vText("Perhatian", color: Colors.red),
          content: vText(content),
          actions: <Widget>[
            FlatButton(
              child: vText("Batalkan"),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            FlatButton(
              child: vText("OK"),
              onPressed: () {
                Navigator.pop(context, true);
              },
            )
          ],
        );
      },
    );
  }
}
