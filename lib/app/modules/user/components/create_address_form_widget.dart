import 'package:flutter/material.dart';

class CreateAddressFormWidget extends StatelessWidget {
  final String title;
  const CreateAddressFormWidget({Key? key, this.title = "CreateAddressFormWidget"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(title));
  }
}