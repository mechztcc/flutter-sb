import 'package:flutter_sb/app/modules/user/repositories/user_repository.dart';
import 'package:flutter_sb/app/modules/user/services/user_service.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  final UserService userService;

  _UserStoreBase(this.userService);

  Future<void> createAccount(String name, String email, String password) async {
    try {
      await userService.createAccount(name, email, password);
    } catch (e) {
      print(e);
    }
  }
}
