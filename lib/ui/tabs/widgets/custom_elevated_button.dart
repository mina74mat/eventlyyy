import 'package:eventlyyy/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  VoidCallback onPressed;
  String text;
  Color backgroundColor;
  Color? textColor;
  bool icon;
  Color? borderColor;
  Widget? iconWidget;

  CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    Color? backgroundColor,
    this.textColor = Colors.white,
    this.borderColor,
    this.icon = false,
    this.iconWidget,
  }) : backgroundColor = backgroundColor ?? AppColors.primaryLight;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: EdgeInsets.all(14),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor ?? AppColors.primaryLight),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: icon
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconWidget!,
                  SizedBox(width: width * 0.02),
                  Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ],
              )
            : Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
      ),
    );
  }
}
