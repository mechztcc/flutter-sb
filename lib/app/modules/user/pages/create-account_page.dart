import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sb/app/modules/address/models/address_model.dart';
import 'package:flutter_sb/app/modules/user/components/create_account_form_widget.dart';
import 'package:flutter_sb/app/modules/user/components/create_address_form_widget.dart';
import 'package:flutter_sb/app/modules/user/controllers/user_store.dart';
import 'package:flutter_sb/app/modules/user/models/user_model.dart';

class CreateAccountPage extends StatefulWidget {
  final String title;
  bool profile = true;
  bool address = false;
  CreateAccountPage({
    Key? key,
    this.title = 'CreateAccountPage',
  }) : super(key: key);
  @override
  CreateAccountPageState createState() => CreateAccountPageState();
}

class CreateAccountPageState extends ModularState<CreateAccountPage, UserStore> {


  UserModel? _user;
  AddressModel? _address;

  void addUser(UserModel user) {
    _user = user;
    setState(() {
      widget.profile = false;
      widget.address = true;
    });
  }

  void addAddress(AddressModel address) {
    _address = address;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => Center(
          child: widget.profile == true ?  CreateAccountFormWidget(addUser: addUser) : CreateAddressFormWidget(),
        ),
      ),
    );
  }
}
