import 'package:flutter_sb/app/modules/category/models/category_model.dart';

class ProductModel {
  int? id;
  String? name;
  String? price;
  String? size;
  String? createdAt;
  String? updatedAt;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.size,
    this.createdAt,
    this.updatedAt,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    size = json['size'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['size'] = size;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
