import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;

  const Button({super.key, required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        name,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
