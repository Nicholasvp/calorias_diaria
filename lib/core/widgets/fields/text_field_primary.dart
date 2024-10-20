import 'package:flutter/material.dart';

class TextFieldPrimary extends StatelessWidget {
  const TextFieldPrimary({
    super.key,
    required this.controller,
    required this.label,
    this.radius = 10,
    this.initialValue,
    this.required = true,
  });
  final TextEditingController controller;
  final String? initialValue;
  final String label;
  final double radius;
  final bool required;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        labelText: label,
      ),
      validator: (value) {
        if (required && value!.isEmpty) {
          return 'Campo obrigatório';
        }
        return null;
      },
    );
  }
}
