import 'package:flutter_sb/app/modules/bag/model/bag_item.dart';

class BagModel {
  int? id;
  String? createdAt;
  String? updatedAt;
  List<BagItem>? items;

  BagModel({this.id, this.createdAt, this.updatedAt, this.items});

  BagModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['items'] != null) {
      items = <BagItem>[];
      json['items'].forEach((v) {
        items!.add(BagItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}