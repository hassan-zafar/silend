import 'package:flutter/material.dart';
import 'package:silend/Theme/colors.dart';
import 'package:silend/Theme/constants.dart';

// ignore: must_be_immutable
class CustomTextButton extends StatelessWidget {
  CustomTextButton(
      {required this.onTap,
      required this.isGradient,
      required this.text,
      this.paddingHor,
      this.text2,
      this.enableMargin = true,
      this.textAlign,
      this.fontSize = 20,
      this.paddingVert,
      this.isdropDown = false,
      Key? key})
      : super(key: key);
  final String text;
  final String? text2;

  final double? paddingVert;
  final double fontSize;
  final double? paddingHor;
  final TextAlign? textAlign;
  bool isdropDown;
  final bool enableMargin;
  bool? isGradient = true;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin:
            enableMargin ? EdgeInsets.symmetric(vertical: padding / 2) : null,
        padding: EdgeInsets.symmetric(
          vertical: paddingVert ?? padding,
          horizontal: paddingHor ?? padding * 3,
        ),
        decoration: BoxDecoration(
          color: textFieldColor,
          gradient: isGradient!
              ? LinearGradient(
                  colors: [btnGradLeft, btnGradRight],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)
              : null,
          borderRadius: enableMargin ? borderRadius : borderRadius,
        ),
        child: isdropDown
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
                    textAlign: textAlign ?? TextAlign.center,
                    style: TextStyle(
                      color: lightTextColor,
                      letterSpacing: 1,
                      fontSize: fontSize,
                    ),
                  ),
                  Text(
                    text2!,
                    textAlign: textAlign ?? TextAlign.center,
                    style: TextStyle(
                      color: disabledTextColor,
                      letterSpacing: 1,
                      fontSize: fontSize,
                    ),
                  ),
                ],
              )
            : Text(
                text,
                textAlign: textAlign ?? TextAlign.center,
                style: TextStyle(
                  color: lightTextColor,
                  // letterSpacing: 1,
                  fontSize: fontSize,
                ),
              ),
      ),
    );
  }
}
