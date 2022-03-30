import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sb/app/modules/dashboard/controllers/dashboard_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sb/app/modules/foodstore/controllers/foodstore_store.dart';
import 'package:flutter_sb/app/modules/foodstore/models/foodstore_model.dart';

class DashboardPage extends StatefulWidget {
  final String title;
  const DashboardPage({Key? key, this.title = 'DashboardPage'}) : super(key: key);
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
        title: Text(widget.title),
        actions: [
          IconButton(onPressed: () {
            Modular.to.pushNamed('/');
          }, icon: Icon(Icons.arrow_back),)
        ],
      ),
      body: FutureBuilder(
        future: store.listAll(),
        builder: ((context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            List<FoodstoreModel> data = snapshot.data as List<FoodstoreModel>;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.shop),
                  title: Text(data[index].name),
                  trailing: const Icon(Icons.segment_outlined),
                );
              }
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      )
    );
  }
}