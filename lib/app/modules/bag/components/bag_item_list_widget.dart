import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sb/app/modules/bag/controllers/bag_store.dart';

class BagItemListWidget extends StatefulWidget {
  final String title;
  const BagItemListWidget({Key? key, this.title = "BagItemListWidget"}) : super(key: key);

  @override
  State<BagItemListWidget> createState() => _BagItemListWidgetState();
}

class _BagItemListWidgetState extends State<BagItemListWidget> {

  BagStore controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}