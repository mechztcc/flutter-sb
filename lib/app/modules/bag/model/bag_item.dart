class BagItem {
  int? id;
  String? name;
  String? price;
  String? size;
  String? createdAt;
  String? updatedAt;

  BagItem({
    this.id,
    this.name,
    this.price,
    this.size,
    this.createdAt,
    this.updatedAt,
  });

  BagItem.fromJson(Map<String, dynamic> json) {
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
