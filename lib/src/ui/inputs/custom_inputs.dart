import 'package:flutter/material.dart';

class CustomInputs{
  static InputDecoration authInputDecoration({
    required String hint,
    required String label,
    required IconData icon
  }) => InputDecoration(
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white.withOpacity(.3)
      )
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white.withOpacity(.3)
      )
    ),
    hintText: hint,
    hintStyle: const TextStyle(color: Colors.grey),
    labelText: label,
    labelStyle: const TextStyle(color: Colors.grey),
    prefixIcon: Icon(icon, color: Colors.grey),
  );
}