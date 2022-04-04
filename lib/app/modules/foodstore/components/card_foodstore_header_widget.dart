import 'package:flutter/material.dart';

class CardFoodstoreHeaderWidget extends StatelessWidget {
  final String title;
  final double height;
  final double width;
  const CardFoodstoreHeaderWidget({
    Key? key,
    this.title = "CardFoodstoreHeaderWidget",
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        // border: Border.all(width: 2, color: Colors.blue)
      ),
      height: height,
      width: width,
      child: Image.asset(
        'assets/couple.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
