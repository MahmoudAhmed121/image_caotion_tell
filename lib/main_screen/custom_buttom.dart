import 'package:flutter/material.dart';
import 'package:restaurant_booking/constants/colors.dart';

class CustomTextButton extends StatelessWidget {
  final double width;
  final Color background;
  final bool isUpperCase;
  final double radius;
  final bool disable;
  final bool isBorder;
  final VoidCallback onPressed;
  final String text;
  final bool isLoading;
  final double? height;
  final TextStyle? customTextStyle;
  final double fontSize;

  final double elevation;

  const CustomTextButton({
    Key? key,
    this.width = double.infinity,
    this.background = Mycolor.primaryColor,
    this.isBorder = false,
    this.isUpperCase = true,
    this.radius = 4.0,
    required this.onPressed,
    required this.text,
    this.disable = false,
    this.isLoading = false,
    this.height = 42,
    this.customTextStyle,
    this.fontSize = 18.0,
    this.elevation = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textButton = SizedBox(
      height: 400,
      width: 200,
      child: TextButton(
        onPressed: disable ? null : onPressed,
        style: TextButton.styleFrom(
          elevation: elevation,
          backgroundColor: disable ? Colors.grey : background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: isBorder
                ? const BorderSide(color: Colors.white, width: 1.5)
                : BorderSide.none,
          ),
        ),
        child: FittedBox(
          child: Text(
            isUpperCase ? text.toUpperCase() : text,
            style: customTextStyle ??
                TextStyle(
                  color: disable ? Colors.white : Colors.white,
                  fontSize: fontSize,
                ),
          ),
        ),
      ),
    );

    final TextButtonLoading = SizedBox(
      height: height,
      child: TextButton(
        onPressed: disable ? null : onPressed,
        style: TextButton.styleFrom(
          backgroundColor: disable ? Colors.grey : background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: isBorder
                ? const BorderSide(color: Colors.white, width: 1.5)
                : BorderSide.none,
          ),
        ),
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        ),
      ),
    );

    return isLoading
        ? SizedBox(
            height: 50,
            child: TextButtonLoading,
          )
        : SizedBox(
            width: width,
            height: height,
            child: textButton,
          );
  }
}
