import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sb/app/modules/dashboard/components/bottom_bar_widget.dart';
import 'package:flutter_sb/app/modules/product/controller/bag_store.dart';

class BagPage extends StatefulWidget {
  final String title;
  const BagPage({Key? key, this.title = 'Minha bolsa'}) : super(key: key);
  @override
  BagPageState createState() => BagPageState();
}

class BagPageState extends State<BagPage> {
  final BagStore bagController = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(widget.title),
            const Icon(Icons.shopify_rounded),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: ((context, constraints) => Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      child: Image.asset('assets/bag-food.jpg'),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: SizedBox(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight * 0.6,
                    child: ListView.builder(
                      itemCount: bagController.products.length,
                      itemBuilder: ((context, index) => Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    height: 100,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        'assets/burguer2.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          bagController.products[index].name!,
                                          style: const TextStyle(fontSize: 25),
                                        ),
                                        RichText(
                                          text: (TextSpan(
                                            text:
                                                'R\$ ${bagController.products[index].price}',
                                            style: const TextStyle(
                                                color: Color(0xffFB6440),
                                                fontSize: 15),
                                          )),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.delete_forever,
                                                color: Color(0xffFB6440),
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.info_outline,
                                                color: Color(0xff805EE4),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
                const BottomBarWidget()
              ],
            )),
      ),
    );
  }
}
