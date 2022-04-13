import 'package:flutter/material.dart';
import 'package:flutter_sb/app/modules/bag/model/bag_item.dart';

class BagItemWidget extends StatelessWidget {
  final String title;
  final BagItem item;
  final double width;
  final double height;
  const BagItemWidget({
    Key? key,
    this.title = "BagItemWidget",
    required this.item,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 100,
                child: Image.asset('assets/burger3.jpg'),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${item.name?.toUpperCase()}',
                    style: TextStyle(fontSize: 25),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'R\$ ${item.price}',
                      style: const TextStyle(
                          color: Color(0xffFB6440),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text('Tamanho: ${item.size}'),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete_forever,
                          color: Color(0xffFB6440),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
