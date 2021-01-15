import 'package:flutter/material.dart';

class VStyle {

  static const bodyCorner = 32.0;
  static const itemCorner = 24.0;


  static BoxDecoration boxShadow({color = Colors.white, radius = 8.0}) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [shadow()],
    );
  }

  static shadow() {
    return BoxShadow(blurRadius: 2.0, color: Color(0xffD6DCE2));
  }

  static BoxDecoration boxShadowRoundOnlyBottom(
      {color = Colors.white, radius = 8.0}) {
    return BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(radius),
            bottomRight: Radius.circular(radius)),
        boxShadow: [shadow()]);
  }

  static BoxDecoration boxShadowRoundOnlyTop(
      {color, radius = 8.0}) {
    return BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius),
            topRight: Radius.circular(radius)),
        boxShadow: [shadow()]);
  }

  static BoxDecoration corner({color = Colors.white, radius = 8.0}) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
    );
  }
}
