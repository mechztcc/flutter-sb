import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sb/app/modules/dashboard/components/bottom_bar_widget.dart';
import 'package:flutter_sb/app/modules/dashboard/components/foodstores-list_widget.dart';
import 'package:flutter_sb/app/modules/foodstore/controllers/foodstore_store.dart';

class DashboardPage extends StatefulWidget {
  final String title;
  DashboardPage({Key? key, this.title = 'DashboardPage'}) : super(key: key);
  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  final FoodstoreStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text('Lojas Disponíveis'),
            Icon(Icons.add_business_rounded)
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: ((context, constraints) => Column(
              children: const [
                Expanded(
                  child: FoodstoresListWidget(),
                ),
                BottomBarWidget(),
              ],
            )),
      ),
    );
  }
}
