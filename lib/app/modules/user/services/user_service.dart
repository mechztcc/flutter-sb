import 'package:flutter_sb/app/modules/user/models/user_model.dart';
import 'package:flutter_sb/app/modules/user/repositories/user_repository.dart';

class UserService {
  final UserRepository userRepository;

  UserService(this.userRepository);

  Future<void> createAccount(UserModel user) async {
    try {
      await userRepository.createAccount(user);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<UserModel> login(String phone, String password) async {
    try {
      var data = await userRepository.login(phone, password);
      UserModel user = UserModel.fromJson(data);
      return user;
    } catch (e) {
      throw Exception(e);
    }
  }
}
