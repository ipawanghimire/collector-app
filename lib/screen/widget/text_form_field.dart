import 'package:flutter/material.dart';

class ReusableTextFormField extends StatelessWidget {
  const ReusableTextFormField({
    required this.label,
    required this.controller,
    super.key,
    this.password = false,
    this.leftIcon,
    this.rightIcon,
    this.fontSize = 12.0,
    this.validator,
    this.underlineColor,
    this.textColor,
    this.keyboardType,
  });
  final String label;
  final TextEditingController controller;
  final Widget? leftIcon;
  final bool password;
  final IconData? rightIcon;
  final double fontSize;
  final FormFieldValidator<String>? validator;
  final Color? underlineColor;
  final Color? textColor;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    final color = textColor ?? Theme.of(context).colorScheme.onPrimary;

    final defaultUnderlineColor = color;
    final finalUnderlineColor = underlineColor ?? defaultUnderlineColor;

    return TextFormField(
      keyboardType: keyboardType,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
      ),
      controller: controller,
      obscureText: password,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: finalUnderlineColor,
          ),
        ),
        labelText: label,
        prefixIcon: leftIcon,
        suffixIcon: rightIcon != null ? Icon(rightIcon) : null,
        labelStyle: TextStyle(
          fontSize: fontSize,
          color: color,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: finalUnderlineColor,
          ),
        ),
      ),
      validator: validator,
    );
  }
}
