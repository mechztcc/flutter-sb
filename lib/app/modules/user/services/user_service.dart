import 'package:flutter_sb/app/modules/user/repositories/user_repository.dart';

class UserService {
  final UserRepository userRepository;

  UserService(this.userRepository);

  Future<void> createAccount(String name, String email, String password) async {
    try {
      await userRepository.createAccount(name, email, password);
      // navegate to another page, show alert
    } catch (e) {
      throw Exception(e);
    }
  }
}
