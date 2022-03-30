class FoodstoreModel {
  final int id;
  final String name;
  final bool actived;
  final String zip_code;
  final String street;
  final String number;
  final String city;
  final String state;
  final String created_at;
  final String updated_at;

  FoodstoreModel({
    required this.id,
    required this.name,
    required this.actived,
    required this.zip_code,
    required this.street,
    required this.number,
    required this.city,
    required this.state,
    required this.created_at,
    required this.updated_at,
  });

  FoodstoreModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        actived = json['actived'],
        zip_code = json['address']['zip_code'],
        street = json['address']['street'],
        number = json['address']['number'],
        city = json['address']['city'],
        state = json['address']['state'],
        created_at = json['created_at'],
        updated_at = json['updated_at'];
}
