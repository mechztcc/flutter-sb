import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sb/app/modules/bag/components/bag_item_list_widget.dart';
import 'package:flutter_sb/app/modules/bag/components/bag_item_widget.dart';
import 'package:flutter_sb/app/modules/bag/controllers/bag_store.dart';
import 'package:flutter_sb/app/modules/bag/model/bag_model.dart';
import 'package:flutter_sb/app/modules/dashboard/components/bottom_bar_widget.dart';
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

  void removeItem(int itemId) async {
    controller.removeItem(itemId);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller.getTotal();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text('Minhas compras'),
            Icon(Icons.shopify_rounded),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: ((context, constraints) => Column(
              children: [
                Expanded(
                  child: FutureBuilder(
                    future: controller.findBag(),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        BagModel data = snapshot.data as BagModel;
                        return ListView.builder(
                          itemCount: data.items?.length ?? 0,
                          itemBuilder: (context, index) {
                            if (data.items!.isNotEmpty) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                child: BagItemWidget(
                                  item: data.items![index],
                                  height: 150,
                                  width: constraints.maxWidth,
                                  removeItem: removeItem,
                                ),
                              );
                            } else {
                              return const Text('Sua bolsa est?? vazia');
                            }
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
                ),
                Text(
                  'Total ${controller.total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
                GradientButtonWidget(
                  label: 'Esvaziar Bolsa',
                  gradient: const [
                    Color(0xffFB6440),
                    Color(0xffFBAF40),
                  ],
                  func: () async {
                    await controller.clearBag();
                    setState(() {});
                  },
                ),
                const BottomBarWidget()
              ],
            )),
      ),
    );
  }
}
