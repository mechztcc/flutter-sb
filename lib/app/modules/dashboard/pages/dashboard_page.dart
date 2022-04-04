import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sb/app/modules/dashboard/components/bottom_bar_widget.dart';
import 'package:flutter_sb/app/modules/dashboard/controllers/dashboard_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sb/app/modules/foodstore/components/card-foodstore-list_widget.dart';
import 'package:flutter_sb/app/modules/foodstore/controllers/foodstore_store.dart';
import 'package:flutter_sb/app/modules/foodstore/models/foodstore_model.dart';

class DashboardPage extends StatefulWidget {
  final String title;
  const DashboardPage({Key? key, this.title = 'DashboardPage'})
      : super(key: key);
  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  final FoodstoreStore store = Modular.get();

  find() async {
    var a = store.getList();
    print(a);
  }

  @override
  Widget build(BuildContext context) {
    find();
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
        body: FutureBuilder(
          future: store.listAll(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              List<FoodstoreModel> data = snapshot.data as List<FoodstoreModel>;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CardFoodstoreListWidget(foodstore: data[index]),
                      CardFoodstoreListWidget(foodstore: data[index]),
                      CardFoodstoreListWidget(foodstore: data[index]),
                      CardFoodstoreListWidget(foodstore: data[index]),
                      CardFoodstoreListWidget(foodstore: data[index]),
                      CardFoodstoreListWidget(foodstore: data[index]),
                      CardFoodstoreListWidget(foodstore: data[index]),
                    ],
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ));
  }
}
