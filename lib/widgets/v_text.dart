import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:flutter_svg/svg.dart';

Widget vText(
    String title, {
      Color color = Colors.black,
      double fontSize,
      FontWeight fontWeight,
      TextOverflow overflow = TextOverflow.fade,
      TextAlign align,
      bool money = false,
      bool number = false,
      bool poppins = true,
      decoration,
      int maxLines,
      letterSpacing,
    }) {
  FlutterMoneyFormatter fmf;
  if (number || money) {
    fmf = new FlutterMoneyFormatter(
      amount: (title != null && title != "" && title != "null")
          ? double.parse(title)
          : 0.0,
      settings: MoneyFormatterSettings(
        symbol: !number ? 'Rp ' : '',
        thousandSeparator: '.',
        decimalSeparator: '.',
        symbolAndNumberSeparator: ' ',
        fractionDigits: 0,
        compactFormatType: CompactFormatType.short,
      ),
    );
  }

  return Text(
    title != null && title != "null"
        ? money || number
        ? fmf.output.symbolOnLeft
        : title
        : "",
    style: TextStyle(
      fontFamily: "poppins",
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: decoration,
      letterSpacing: letterSpacing ?? null,
    ),
    overflow: overflow,
    textAlign: align,
    maxLines: maxLines,
  );
}

Widget vButton({
  @required title,
  height = 44.0,
  width = double.infinity,
  @required onTap,
  enable = true,
  color = Colors.grey,
  textColor = Colors.white,
  textSize = 14.0,
  border,
}) {
  return InkWell(
    onTap: enable ? onTap : null,
    child: Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: color,
        border: border,
      ),
      child: vText(
        title,
        overflow: TextOverflow.clip,
        color: textColor,
        fontSize: textSize,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget vRoundedText({
  @required String title,
  @required svg,
  color = Colors.grey,
  textColor = Colors.white,
  textSize = 16.0,
  border,
}) {
  return Container(
    width: double.infinity,
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 9),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      color: color,
      border: border,
    ),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(svg),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: vText(
              title,
              color: textColor,
              maxLines: 2,
              fontSize: textSize,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget vLeadingButton(
    {@required title,
      height = 44.0,
      @required onTap,
      @required leading,
      color = Colors.grey,
      textColor = Colors.white}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      height: height,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 9),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: color,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          leading,
          SizedBox(width: 5),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 43),
              child: vText(
                title,
                color: textColor,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
