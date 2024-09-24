import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String labelText;
  final String? initialValue;
  final FormFieldSetter<String> onChanged;
  final FormFieldValidator<String>? validator;
  final bool obscureText;

  CustomFormField({
    required this.labelText,
    this.initialValue,
    required this.onChanged,
    this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(labelText: labelText),
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
