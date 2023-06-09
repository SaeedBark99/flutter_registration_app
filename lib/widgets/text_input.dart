import 'package:flutter/material.dart';

class DefaultTextFromFile extends StatelessWidget {
  TextEditingController controller;
  Function? onsumit;
  String? lable;
  IconData? prefix;
  TextInputType? type;
  Function? validator;
  Widget? suffix;
  bool enable;
  VoidCallback? onTap;
  bool obscureText;
  int? maxLength;

  DefaultTextFromFile({
    super.key,
    required this.controller,
    this.onsumit,
    this.lable,
    this.prefix,
    this.onTap,
    this.type,
    this.validator,
    this.suffix,
    this.maxLength,
    this.enable = true,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      maxLength: maxLength,
      onTap: onTap,
      keyboardType: type,
      onFieldSubmitted: (d) {
        onsumit!(d);
      },
      validator: (value) => validator!(value),
      enabled: enable,
      decoration: InputDecoration(
        labelText: lable,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
