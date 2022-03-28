import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sb/app/modules/dashboard/controllers/dashboard_store.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  final String title;
  const DashboardPage({Key? key, this.title = 'DashboardPage'}) : super(key: key);
  @override
  DashboardPageState createState() => DashboardPageState();
}
class DashboardPageState extends State<DashboardPage> {
  final DashboardStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(onPressed: () {
            Modular.to.pushNamed('/');
          }, icon: Icon(Icons.arrow_back),)
        ],
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}