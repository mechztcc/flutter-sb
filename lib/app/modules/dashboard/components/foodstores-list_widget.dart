import 'package:flutter/material.dart';

class FoodstoresListWidget extends StatelessWidget {
  final String title;
  const FoodstoresListWidget({Key? key, this.title = "FoodstoresListWidget"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(title));
  }
}