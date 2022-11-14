import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget defaultButton(
    {double width = double.infinity,
    double height = 50.0,
    double radius = 0.0,
    double fontSize = 20.0,
    Color backGround = Colors.black,
    required String text,
    required VoidCallback function}) {
  return GestureDetector(
    onTap: function,
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backGround,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: fontSize),
        ),
      ),
    ),
  );
}

Widget defaultTextFormField({
  required TextEditingController controller,
  required IconData prefixIcon,
  required TextInputType keyboardType,
  IconData? suffixIcon,
  VoidCallback? suffixPressed,
  required String label,
  TextInputAction inputAction = TextInputAction.next,
  bool obscureText = false,
  bool readOnly = false,
  bool autoFocus = false,
  bool filledColors = false,
  String? hintText,
  required String? Function(String?)? validator,
  String Function(String?)? onChanged,
  String Function(String?)? onFieldSubmitted,
}) {
  return TextFormField(
    controller: controller,
    onChanged: onChanged,
    readOnly: readOnly,
    autofocus: autoFocus,
    validator: validator,
    obscureText: obscureText,
    keyboardType: keyboardType,
    onFieldSubmitted: onFieldSubmitted,
    textInputAction: inputAction,
    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
    decoration: InputDecoration(
      label: Text(label),
      hintText: hintText,
      fillColor: Colors.greenAccent.withOpacity(.5),
      filled: filledColors,
      prefixIcon: Icon(prefixIcon),
      suffixIcon: suffixIcon != null
          ? IconButton(
              onPressed: suffixPressed,
              icon: Icon(suffixIcon),
            )
          : null,
      border: const OutlineInputBorder(),
    ),
  );
}

String createFlag(String country) {
  switch (country) {
    case "EGP":
      return "🇪🇬";
    case "USD":
      return "🇺🇸";
    case "SAR":
      return "🇸🇦";
    case "LYD":
      return "🇱🇾";
    case "EUR":
      return "💶";
    case "NZD":
      return "🇳🇿";
    case "KWD":
      return "🇰🇼";
    case "BHD":
      return "🇧🇭";
    case "OMR":
      return "🇴🇲";
    case "JOD":
      return "🇯🇴";
    case "GBP":
      return "🇬🇧";
    default:
      return "";
  }
}
