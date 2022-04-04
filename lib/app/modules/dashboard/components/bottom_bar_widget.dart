import 'package:flutter/material.dart';

class BottomBarWidget extends StatelessWidget {
  final String title;
  const BottomBarWidget({Key? key, this.title = "BottomBarWidget"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopify_sharp),
          label: 'Bolsa',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Configuraçoes',
        ),
      ],
    );
  }
}
