import 'package:flutter/material.dart';

Widget defaultTextFromField({
  required TextEditingController controller,
  required String? Function(String?)? validator,
  required String labelText,
  required Widget? prefixIcon,
  IconData? suffixIcon,
  Function()? onPressedSuffix,
  Function()? onTap,
  TextInputType? type,
// IconData iconSuffix,
  bool isPassword = false,
  Function(String value)? onChange,
  Function(String value)? onFieldSubmitted,
}) =>
    TextFormField(
      keyboardType: type,
      controller: controller,
      onChanged: onChange,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      obscureText: isPassword,
      onTap: onTap,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: onPressedSuffix,
                icon: Icon(suffixIcon),
              )
            : null,
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
    );
