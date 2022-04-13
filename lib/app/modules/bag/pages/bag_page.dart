import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sb/app/modules/bag/components/bag_item_list_widget.dart';
import 'package:flutter_sb/app/modules/bag/controllers/bag_store.dart';
import 'package:flutter_sb/app/modules/bag/model/bag_model.dart';
import 'package:flutter_sb/app/modules/user/components/gradient_button_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class BagPage extends StatefulWidget {
  final String title;

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
      body: FutureBuilder(
        initialData: Text('Sua bolsa está vazia'),
        future: controller.findBag(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            BagModel data = snapshot.data as BagModel;
            return ListView.builder(
              itemCount: data.items?.length ?? 0,
              itemBuilder: (context, index) {
                return Container(
                  width: 200,
                  height: 200,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 100,
                        child: Image.asset('assets/burger3.jpg'),
                      ),
                      Column(
                        children: [
                          Text('${data.items?[index].name}'),
                          Text('${data.items?[index].price}'),
                          Text('${data.items?[index].size}'),
                        ],
                      )
                    ],
                  ),
                );
              },
            );
          } else {
            return LoadingAnimationWidget.inkDrop(
              color: const Color(0xff805EE4),
              size: 40,
            );
          }
        }),
      ),
    );
  }
}
