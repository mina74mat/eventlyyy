import 'package:flutter/material.dart';

typedef OnValidator = String? Function(String?)?;

class CustomTextFormField extends StatelessWidget {
  Color colorBorderSide;
  String? hintText;
  TextStyle? hintStyle;
  String? labelText;
  TextStyle? labelStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  OnValidator validator;
  TextEditingController controller;
  bool obscureText;

  CustomTextFormField({
    super.key,
    this.colorBorderSide = Colors.grey,
    this.hintText,
    this.hintStyle,
    this.labelText,
    this.labelStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    required this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: TextFormField(
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle:
              hintStyle ??
              TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.grey,
              ),
          labelText: labelText,
          labelStyle:
              labelStyle ??
              TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.grey,
              ),
          enabledBorder: builtDecorationBorder(
            colorBorderSide: colorBorderSide,
          ),
          focusedBorder: builtDecorationBorder(
            colorBorderSide: colorBorderSide,
          ),
          errorBorder: builtDecorationBorder(colorBorderSide: Colors.red),
          focusedErrorBorder: builtDecorationBorder(
            colorBorderSide: Colors.red,
          ),
        ),
        validator: validator,
        controller: controller,
        obscureText: obscureText,
      ),
    );
  }

  OutlineInputBorder builtDecorationBorder({required Color colorBorderSide}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(width: 1, color: colorBorderSide),
    );
  }
}
