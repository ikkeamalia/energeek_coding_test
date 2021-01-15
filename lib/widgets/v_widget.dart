import 'package:energeek_test/utils/color_loader.dart';
import 'package:energeek_test/utils/v_color.dart';
import 'package:energeek_test/widgets/v_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBackPressed;
  final Color backgroundColor;
  final Color titleColor;
  final bool bold;
  final Function leadingFunction;
  final bool centerTitle;
  final Icon leading;

  VAppBar(
      {this.title,
        @required this.onBackPressed,
        this.leading,
        this.leadingFunction,
        this.backgroundColor,
        this.titleColor,
        this.centerTitle,
        this.bold});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.white,
      centerTitle: centerTitle ?? true,
      title: vText(title ?? "",
          fontWeight: FontWeight.w600, color: titleColor ?? Colors.black),
      leading: IconButton(
        icon: leading ??
            Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20,
            ),
        onPressed: leadingFunction ??
                () {
              Navigator.pop(context);
            },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(47.8);
}

class VButton extends StatelessWidget {
  final String title;
  final Color fontColor;
  final Color backgroundColor;
  final double paddingSymmetric;
  final double paddingHorizontal;

  VButton(
      this.title, {
        this.fontColor,
        this.backgroundColor,
        this.paddingHorizontal,
        this.paddingSymmetric,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: paddingSymmetric ?? 13, horizontal: paddingHorizontal ?? 0),
      decoration: BoxDecoration(color: backgroundColor ?? Colors.grey),
      child: Center(
        child: vText(title, color: fontColor ?? Colors.black, fontSize: 15),
      ),
    );
  }
}

class VInputText extends StatelessWidget {
  final TextInputType keyboardType;
  final String hint;
  final TextEditingController controller;
  final TextCapitalization capitalization;
  final validator;
  final onSaved;
  final double height;
  final double padding;
  final onChange;
  final initialValue;
  final suffixIcon;
  final prefixIcon;
  final bool enabled;
  final bool readOnly;
  final int maxLines;
  final int minLines;
  final double fontSize;
  final int maxLength;

  VInputText(
      this.hint, {
        this.keyboardType,
        this.height,
        this.padding = 10,
        this.readOnly = false,
        this.controller,
        this.validator,
        this.onSaved,
        this.initialValue,
        this.enabled = true,
        this.onChange,
        this.suffixIcon,
        this.prefixIcon,
        this.maxLines,
        this.fontSize,
        this.minLines,
        this.maxLength,
        this.capitalization = TextCapitalization.none,
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      initialValue: initialValue ?? null,
      controller: controller ?? null,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(8.0),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[300]),
          borderRadius: BorderRadius.circular(8.0),
        ),
        hintText: hint,
        contentPadding: EdgeInsets.all(padding),
        hintStyle: TextStyle(fontFamily: "poppins", fontSize: fontSize),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
      keyboardType: this.keyboardType ?? TextInputType.text,
      style: TextStyle(
          fontFamily: "poppins",
          fontSize: fontSize,
          color: enabled ? Colors.black : VColor.grey600),
      textCapitalization: capitalization,
      validator: validator,
      onSaved: onSaved,
      onChanged: onChange,
      maxLines: maxLines,
      minLines: minLines,
      readOnly: readOnly,
      maxLength: maxLength,
    );
  }
}

class VDivider extends StatelessWidget {
  final double vertical;

  VDivider({this.vertical = 20.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: vertical),
      height: 1,
      color: VColor.grey,
    );
  }
}

class VBubbleIcon extends StatelessWidget {
  final IconData icon;

  VBubbleIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: VColor.blue400,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 16,
      ),
    );
  }
}

class VPageLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 8.0,
      width: MediaQuery.of(context).size.width,
      child: LinearProgressIndicator(),
    );
  }
}

class VLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ColorLoader2(
          color1: VColor.azure,
          color2: Colors.blue,
          color3: VColor.azure,
        ),
      ),
    );
  }
}

class NoData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return vText("Tidak ada data");
  }
}

class VBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: VColor.blue400,
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.arrow_back, color: Colors.white, size: 16),
      ),
    );
  }
}

class VCloseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: VColor.blue400,
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.close, color: Colors.white, size: 16),
    );
  }
}

