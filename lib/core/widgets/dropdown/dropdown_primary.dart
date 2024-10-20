import 'package:flutter/material.dart';

class DropdownPrimary extends StatefulWidget {
  const DropdownPrimary({
    super.key,
    required this.label,
    required this.items,
    required this.controller,
    this.radius = 10.0,
    this.required = true,
  });
  final String label;
  final Map<String, String> items;
  final TextEditingController controller;
  final double radius;
  final bool required;

  @override
  State<DropdownPrimary> createState() => _DropdownPrimaryState();
}

class _DropdownPrimaryState extends State<DropdownPrimary> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    if (widget.controller.text.isNotEmpty && widget.items.containsKey(widget.controller.text)) {
      _selectedValue = widget.controller.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedValue,
      items: widget.items.entries
          .map(
            (entry) => DropdownMenuItem<String>(
              value: entry.key,
              child: Text(entry.value),
            ),
          )
          .toList(),
      onChanged: (String? value) {
        setState(() {
          _selectedValue = value!;
          widget.controller.text = value;
        });
      },
      decoration: InputDecoration(
        labelText: widget.label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(widget.radius),
          ),
        ),
      ),
      validator: (value) {
        if (widget.required && value == null) {
          return 'Campo obrigatório';
        }
        return null;
      },
    );
  }
}
