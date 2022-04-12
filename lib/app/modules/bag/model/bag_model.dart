class BagModel {
  int? id;
  List<BagItem>? items;

  BagModel({this.id, this.items});

  BagModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }
}

class BagItem {
  final int? id;
  final String name;
  final String price;
  final String size;

  BagItem({
    this.id,
    required this.name,
    required this.price,
    required this.size,
  });
}
