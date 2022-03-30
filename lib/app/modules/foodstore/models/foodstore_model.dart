class FoodstoreModel {
  final int id;
  final String name;
  final bool actived;
  final String created_at;
  final String updated_at;

  FoodstoreModel({
    required this.id,
    required this.name,
    required this.actived,
    required this.created_at,
    required this.updated_at,
  });

  FoodstoreModel.fromJson(Map<String, dynamic> json):
    id = json['id'],
    name = json['name'],
    actived = json['actived'],
    created_at = json['created_at'],
    updated_at = json['updated_at'];
}
