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


  Future<dynamic> login(String email, String password) async {
    try {
      await userRepository.login(email, password);
    } catch (e) {
      throw Exception(e);
    }
  }
}
