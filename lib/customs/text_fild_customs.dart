import 'package:flutter/material.dart';
import 'package:store_app_2/constens.dart';

// ignore: must_be_immutable
class CustomtextField extends StatelessWidget {
  CustomtextField(
      {super.key,
      required this.labelText,
      this.seffixicon,
      this.icon,
      required this.onchange,
      this.obscure = false,
      this.textInputType,
      this.validate});

  String labelText;
  IconData? icon;
  Function(String) onchange;
  Function? validate;
  Widget? seffixicon;
  bool obscure;
  TextInputType? textInputType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      validator: (value) {
        return validate!(value);
      },
      onChanged: onchange,
      obscureText: obscure,
      decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: icon != null ? Icon(icon) : null,
          prefixIconColor: KPriymryColor,
          suffixIcon: seffixicon,
          labelStyle: const TextStyle(color: KPriymryColor),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: KPriymryColor,
              width: 2,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: KPriymryColor,
              width: 2,
            ),
          )),
    );
  }
}
