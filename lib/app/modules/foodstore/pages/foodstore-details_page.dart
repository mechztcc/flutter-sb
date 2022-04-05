import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sb/app/modules/category/components/list-category_widget.dart';
import 'package:flutter_sb/app/modules/category/controllers/category_store.dart';
import 'package:flutter_sb/app/modules/dashboard/components/bottom_bar_widget.dart';
import 'package:flutter_sb/app/modules/foodstore/components/card_foodstore_header_widget.dart';

class FoodstoreDetailsPage extends StatefulWidget {
  final String title;
  final String foodstoreId;
  const FoodstoreDetailsPage({
    Key? key,
    this.title = 'FoodstoreDetailsPage',
    required this.foodstoreId,
  }) : super(key: key);
  @override
  FoodstoreDetailsPageState createState() => FoodstoreDetailsPageState();
}

class FoodstoreDetailsPageState extends State<FoodstoreDetailsPage> {
  final CategoryStore categoryController = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('foodstore n° ${widget.foodstoreId}'),
      ),
      body: LayoutBuilder(
        builder: ((context, constraints) => Column(
              children: <Widget>[
                SizedBox(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            CardFoodstoreHeaderWidget(
                              height: constraints.maxHeight * 0.3,
                              width: constraints.maxWidth,
                            ),
                            SingleChildScrollView(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                child: ListCategoryWidget(
                                  width: constraints.maxWidth,
                                  height: constraints.maxHeight * 0.55,
                                  foodstoreId: widget.foodstoreId,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const BottomBarWidget()
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
