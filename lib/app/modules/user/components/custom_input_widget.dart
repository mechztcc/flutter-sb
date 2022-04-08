import 'package:flutter/material.dart';

class CustomInputWidget extends StatelessWidget {
  final String title;
  final String label;
  final Icon icon;
  final dynamic validator;
  final TextEditingController controller;
  bool? obscure;
  CustomInputWidget({
    Key? key,
    this.title = "CustomInputWidget",
    required this.label,
    required this.icon,
    required this.validator,
    required this.controller,
    this.obscure
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        validator: validator,
        controller: controller,
        obscureText: obscure ?? false,
        decoration: InputDecoration(
          label: Text(label),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: IconButton(
            icon: icon,
            onPressed: () {
              
            },
          ),
        ),
      ),
    );
  }
}
