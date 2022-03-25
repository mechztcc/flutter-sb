import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sb/app/modules/user/components/create_account_form_widget.dart';
import 'package:flutter_sb/app/modules/user/controllers/user_store.dart';

class CreateAccountPage extends StatefulWidget {
  final String title;
  const CreateAccountPage({Key? key, this.title = 'CreateAccountPage'})
      : super(key: key);
  @override
  CreateAccountPageState createState() => CreateAccountPageState();
}

class CreateAccountPageState
    extends ModularState<CreateAccountPage, UserStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => const Center(
          child: CreateAccountFormWidget(),
        ),
      ),
    );
  }
}
