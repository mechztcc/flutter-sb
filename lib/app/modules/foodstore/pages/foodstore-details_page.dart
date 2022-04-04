import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sb/app/modules/category/components/list-category_widget.dart';
import 'package:flutter_sb/app/modules/category/controllers/category_store.dart';
import 'package:flutter_sb/app/modules/dashboard/components/bottom_bar_widget.dart';
import 'package:flutter_sb/app/modules/foodstore/components/card_foodstore_header_widget.dart';
import 'package:flutter_sb/app/modules/product/components/card_product_widget.dart';
import 'package:flutter_sb/app/modules/user/components/gradient_button_widget.dart';

class FoodstoreDetailsPage extends StatefulWidget {
  final String title;
  final String foodstoreId;
  const FoodstoreDetailsPage(
      {Key? key,
      this.title = 'FoodstoreDetailsPage',
      required this.foodstoreId})
      : super(key: key);
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
                            ListCategoryWidget(
                              height: constraints.maxHeight * 0.1,
                              width: constraints.maxWidth,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: SizedBox(
                                height: constraints.maxHeight * 0.3,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return const CardProductWidget();
                                  },
                                ),
                              ),
                            ),
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
