class UserModel {
  final int id;
  final String name;
  final String email;
  final String token;
  final String created_at;
  final String updated_at;

  UserModel(
    this.token, {
    required this.id,
    required this.name,
    required this.email,
    required this.created_at,
    required this.updated_at,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['user']['id'],
        name = json['user']['name'],
        email = json['user']['email'],
        token = json['token'],
        created_at = json['user']['created_at'],
        updated_at = json['user']['updated_at'];
}
