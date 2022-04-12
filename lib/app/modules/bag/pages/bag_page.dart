import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sb/app/modules/bag/components/bag_item_list_widget.dart';
import 'package:flutter_sb/app/modules/bag/controllers/bag_store.dart';
import 'package:flutter_sb/app/modules/user/components/gradient_button_widget.dart';

class BagPage extends StatefulWidget {
  final String title;
  bool isEmpty = true;
  BagPage({
    Key? key,
    this.title = 'BagPage',
  }) : super(key: key);
  @override
  BagPageState createState() => BagPageState();
}

class BagPageState extends State<BagPage> {
  final BagStore controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [Text('Minhas compras'), Icon(Icons.shopify_rounded)],
        ),
      ),
      body: LayoutBuilder(
        builder: (((context, constraints) => SizedBox(
              height: constraints.maxHeight * 0.4,
              width: constraints.maxWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Sua bolsa ainda está vazia!'),
                  const SizedBox(
                    height: 20,
                  ),
                  GradientButtonWidget(
                    label: 'Abrir uma bolsa',
                    gradient: const [
                      Color(0xff5F72E4),
                      Color(0xff805EE4),
                    ],
                    func: () async {
                      print('aqui');
                    },
                  )
                ],
              ),
            ))),
      ),
    );
  }
}
