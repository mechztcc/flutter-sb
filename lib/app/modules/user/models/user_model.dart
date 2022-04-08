class UserModel {
  final int? id;
  final String name;
  final String email;
  final String? token;
  final String password;
  final String? created_at;
  final String? updated_at;

  UserModel({
    this.token,
    this.id,
    required this.name,
    required this.email,
    required this.password,
    this.created_at,
    this.updated_at,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['user']['id'],
        name = json['user']['name'],
        email = json['user']['email'],
        token = json['token'],
        password = json['password'],
        created_at = json['user']['created_at'],
        updated_at = json['user']['updated_at'];
}
