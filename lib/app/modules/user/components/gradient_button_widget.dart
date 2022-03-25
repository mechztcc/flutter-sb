import 'package:flutter/material.dart';

class GradientButtonWidget extends StatelessWidget {
  final String title;
  final String label;
  final List<Color> gradient;
  final Function func;
  const GradientButtonWidget(
      {Key? key,
      this.title = "GradientButtonWidget",
      required this.label,
      required this.gradient,
      required this.func})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          colors: gradient,
        ),
      ),
      child: TextButton(
        onPressed: () {
          func();
        },
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
