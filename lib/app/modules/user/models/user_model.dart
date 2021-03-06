import 'package:flutter_sb/app/modules/address/models/address_model.dart';

class UserModel {
  int? id;
  String? name;
  String? phone;
  String? password;
  String? token;
  AddressModel? address;

  UserModel({this.name, this.phone, this.password, this.address});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['customer']['id'];
    name = json['customer']['name'];
    phone = json['customer']['phone'];
    token = json['token'];
    address =
        json['address'] != null ?  AddressModel.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['password'] = this.password;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    return data;
  }
}