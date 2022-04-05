import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  final String title;
  final String id;
  const ProductDetailsPage({Key? key, this.title = 'ProductDetailsPage', required this.id}) : super(key: key);
  @override
  ProductDetailsPageState createState() => ProductDetailsPageState();
}
class ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}