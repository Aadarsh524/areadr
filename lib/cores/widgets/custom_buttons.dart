import 'package:areadr/cores/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomBackgroundButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color backgroundColor;
  final Color foregroundColor;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry borderRadius;
  final TextStyle? textStyle;

  const CustomBackgroundButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor = AppColors.primary,
    this.foregroundColor = Colors.white,
    this.padding = const EdgeInsets.symmetric(horizontal: 25.0),
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: padding,
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
      ),
      child: Text(
        text,
        style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color borderColor;
  final double borderWidth;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry borderRadius;
  final TextStyle? textStyle;

  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.borderColor = AppColors.secondary,
    this.borderWidth = 2.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 25.0, vertical: 0.0),
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: borderColor, width: borderWidth),
        padding: padding,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
      ),
      child: Text(text,
          style: textStyle ?? Theme.of(context).textTheme.titleMedium),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final TextStyle? textStyle;

  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyle ?? Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}

class CustomElevatedIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String labelText;
  final String iconPath;
  final Color backgroundColor;
  final Color textColor;
  final double iconHeight;
  final double iconWidth;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry borderRadius;
  final TextStyle? textStyle;

  const CustomElevatedIconButton({
    super.key,
    required this.onPressed,
    required this.labelText,
    required this.iconPath,
    this.backgroundColor = AppColors.primary,
    this.textColor = AppColors.white,
    this.iconHeight = 24.0,
    this.iconWidth = 24.0,
    this.padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Image.asset(
        iconPath,
        height: iconHeight,
        width: iconWidth,
      ),
      label: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Text(
          labelText,
          style: textStyle ??
              TextStyle(
                fontSize: 16,
                color: textColor,
              ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
