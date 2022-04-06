import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sb/app/modules/foodstore/models/foodstore_model.dart';

class CardFoodstoreListWidget extends StatelessWidget {
  final String title;
  final FoodstoreModel foodstore;

  const CardFoodstoreListWidget({
    Key? key,
    this.title = "CardFoodstoreListWidget",
    required this.foodstore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Modular.to.pushNamed('/foodstore/${foodstore.id}');
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  height: 100,
                  width: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/burguer2.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        foodstore.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(foodstore.city),
                      Text(foodstore.state),
                      Text(foodstore.number),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
