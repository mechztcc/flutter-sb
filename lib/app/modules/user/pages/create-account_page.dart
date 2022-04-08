import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sb/app/modules/user/components/create_account_form_widget.dart';
import 'package:flutter_sb/app/modules/user/components/create_address_form_widget.dart';
import 'package:flutter_sb/app/modules/user/controllers/user_store.dart';
import 'package:flutter_sb/app/modules/user/models/user_model.dart';

class CreateAccountPage extends StatefulWidget {
  final String title;
  bool profile = false;
  bool address = true;
  CreateAccountPage({
    Key? key,
    this.title = 'CreateAccountPage',
  }) : super(key: key);
  @override
  CreateAccountPageState createState() => CreateAccountPageState();
}

class CreateAccountPageState extends ModularState<CreateAccountPage, UserStore> {


  UserModel? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => Center(
          child: widget.profile == true ?  CreateAccountFormWidget() : CreateAddressFormWidget(),
        ),
      ),
    );
  }
}
