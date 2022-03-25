import 'package:flutter/material.dart';

class CreateAccountFormWidget extends StatelessWidget {
  final String title;
  const CreateAccountFormWidget({Key? key, this.title = "CreateAccountFormWidget"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(title));
  }
}