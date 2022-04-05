import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sb/app/modules/category/controllers/category_store.dart';
import 'package:flutter_sb/app/modules/category/models/category_model.dart';
import 'package:flutter_sb/app/modules/category/models/category_products_model.dart';
import 'package:flutter_sb/app/modules/product/components/card_product_widget.dart';
import 'package:flutter_sb/app/modules/user/components/gradient_button_widget.dart';

class ListCategoryWidget extends StatefulWidget {
  final String foodstoreId;
  final String title;
  final double width;
  final double height;
  const ListCategoryWidget({
    Key? key,
    this.title = "ListCategoryWidget",
    required this.width,
    required this.height,
    required this.foodstoreId,
  }) : super(key: key);

  @override
  State<ListCategoryWidget> createState() => _ListCategoryWidgetState();
}

class _ListCategoryWidgetState extends State<ListCategoryWidget> {
  final CategoryStore categoryController = Modular.get();

  final List<Color> gradient = const [Color(0xff5F72E4), Color(0xff805EE4)];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: categoryController
          .listAllCategoriesWithProds(int.tryParse(widget.foodstoreId) ?? 0),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List<CategoryProductsModel> data =
              snapshot.data as List<CategoryProductsModel>;
          return SizedBox(
            height: widget.height,
            width: widget.width,
            child: ListView.builder(
              itemCount: data.length,
              scrollDirection: Axis.vertical,
              itemBuilder: ((context, index) => Row(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50,
                              width: widget.width,
                              child: GradientButtonWidget(
                                label: data[index].name ?? '',
                                func: () {},
                                gradient: gradient,
                              ),
                            ),
                            SizedBox(
                              width: widget.width,
                              height: widget.height * 0.55,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: data[index].product?.length,
                                itemBuilder: ((context, i) => CardProductWidget(product: data[index].product![i])),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
