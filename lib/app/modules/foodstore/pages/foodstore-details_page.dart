import 'package:flutter/material.dart';

class FoodstoreDetailsPage extends StatefulWidget {
  final String title;
  final String foodstoreId;
  const FoodstoreDetailsPage({Key? key, this.title = 'FoodstoreDetailsPage', required this.foodstoreId})
      : super(key: key);
  @override
  FoodstoreDetailsPageState createState() => FoodstoreDetailsPageState();
}

class FoodstoreDetailsPageState extends State<FoodstoreDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('foodstore n° ${widget.foodstoreId}'),
      ),
      body: Column(
        children: <Widget>[
          Text('Id da loja é ${widget.foodstoreId}'),
        ],
      ),
    );
  }
}
