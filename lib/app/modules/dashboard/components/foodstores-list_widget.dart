import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sb/app/modules/foodstore/components/card-foodstore-list_widget.dart';
import 'package:flutter_sb/app/modules/foodstore/controllers/foodstore_store.dart';
import 'package:flutter_sb/app/modules/foodstore/models/foodstore_model.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class FoodstoresListWidget extends StatefulWidget {
  final String title;
  const FoodstoresListWidget({
    Key? key,
    this.title = "FoodstoresListWidget",
  }) : super(key: key);

  @override
  State<FoodstoresListWidget> createState() => _FoodstoresListWidgetState();
}

class _FoodstoresListWidgetState extends State<FoodstoresListWidget> {
  final FoodstoreStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: store.listAll(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List<FoodstoreModel> data = snapshot.data as List<FoodstoreModel>;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    CardFoodstoreListWidget(foodstore: data[index]),
                  ],
                ),
              );
            },
          );
        } else {
          return Center(
            child: LoadingAnimationWidget.inkDrop(color: const Color(0xff805EE4), size: 40),
          );
        }
      }),
    );
  }
}
