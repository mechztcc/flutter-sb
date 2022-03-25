import 'package:flutter/material.dart';

class CustomInputWidget extends StatelessWidget {
  final String title;
  final String label;
  final Icon icon;
  const CustomInputWidget(
      {Key? key,
      this.title = "CustomInputWidget",
      required this.label,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
          label: Text(label),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: IconButton(
            icon: icon,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
