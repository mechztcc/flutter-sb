import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sb/app/modules/bag/bag_store.dart';
import 'package:flutter/material.dart';

class BagPage extends StatefulWidget {
  final String title;
  const BagPage({Key? key, this.title = 'BagPage'}) : super(key: key);
  @override
  BagPageState createState() => BagPageState();
}
class BagPageState extends State<BagPage> {
  final BagStore store = Modular.get();

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