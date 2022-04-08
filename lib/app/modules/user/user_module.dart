import 'package:dio/dio.dart';
import 'package:flutter_sb/app/modules/user/controllers/user_store.dart';
import 'package:flutter_sb/app/modules/user/pages/login_page.dart';
import 'package:flutter_sb/app/modules/user/repositories/user_repository.dart';
import 'package:flutter_sb/app/modules/user/pages/create-account_page.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sb/app/modules/user/services/user_service.dart';

class UserModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => Dio()),
    Bind.lazySingleton((i) => UserStore(i())),
    Bind.lazySingleton((i) => UserRepository(i())),
    Bind.lazySingleton((i) => UserService(i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => CreateAccountPage()),
    ChildRoute('/login', child: (_, args) => const LoginPage()),
  ];
}
