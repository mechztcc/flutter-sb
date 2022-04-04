import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sb/app/modules/category/components/list-category_widget.dart';
import 'package:flutter_sb/app/modules/category/controllers/category_store.dart';
import 'package:flutter_sb/app/modules/dashboard/components/bottom_bar_widget.dart';
import 'package:flutter_sb/app/modules/foodstore/components/card_foodstore_header_widget.dart';
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
                              width: constraints.maxWidth * 0.9,
                            ),
                            ListCategoryWidget(
                                height: constraints.maxHeight * 0.1,
                                width: constraints.maxWidth),
                            SizedBox(
                              height: 200,
                              width: 200,
                              child: Card(
                                child: Column(
                                  children: [
                                    Image.asset('assets/burger.jpg'),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 40,
                                          child: GradientButtonWidget(
                                            label: 'ADD',
                                            gradient: const [
                                              Color(0xff5F72E4),
                                              Color(0xff805EE4),
                                            ],
                                            func: () {},
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.remove),
                                        ),
                                        const Text('1'),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.add),
                                        )
                                      ],
                                    )
                                  ],
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
