import 'package:asuka/asuka.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sb/app/modules/user/services/user_service.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<void> login(String email, String password) async {
    try {
      var response = await userService.login(email, password);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', response.token);
      prefs.setString('name', response.name);
      Modular.to.popAndPushNamed('/dashboard');
    } catch (e) {
      AsukaSnackbar.alert('Problemas ao realizar o login').show();
    }
  }
}
