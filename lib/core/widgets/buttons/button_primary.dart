import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({
    super.key,
    required this.label,
    this.isLoading = false,
    required this.onPressed,
  });
  final String label;
  final bool isLoading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: isLoading
              ? SizedBox.fromSize(
                  size: const Size(20, 20),
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                  ))
              : Text(
                  label,
                  style: const TextStyle(color: Colors.white),
                ),
        ),
      ),
    );
  }
}
