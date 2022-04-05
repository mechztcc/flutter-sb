import 'package:flutter_sb/app/modules/product/models/product_model.dart';

class CategoryProductsModel {
  int? id;
  String? name;
  List<ProductModel>? product;

  CategoryProductsModel({this.id, this.name, this.product});

  CategoryProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['product'] != null) {
      product = <ProductModel>[];
      json['product'].forEach((v) {
        product!.add( ProductModel.fromJson(v));
      });
    }
  }

}
