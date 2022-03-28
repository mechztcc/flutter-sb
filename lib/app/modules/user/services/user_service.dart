import 'package:flutter_sb/app/modules/user/models/user_model.dart';
import 'package:flutter_sb/app/modules/user/repositories/user_repository.dart';

class UserService {
  final UserRepository userRepository;

  UserService(this.userRepository);

  Future<void> createAccount(String name, String email, String password) async {
    try {
      await userRepository.createAccount(name, email, password);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<UserModel> login(String email, String password) async {
    try {
      var data = await userRepository.login(email, password);
      UserModel user = UserModel.fromJson(data);
      return user;
    } catch (e) {
      throw Exception(e);
    }
  }
}
