import 'package:flutter/material.dart';
import 'package:flutter_sb/app/modules/product/models/product_model.dart';
import 'package:flutter_sb/app/modules/user/components/gradient_button_widget.dart';

class CardProductWidget extends StatelessWidget {
  final String title;
  final ProductModel product;
  const CardProductWidget(
      {Key? key, this.title = "CardProductWidget", required this.product})
      : super(key: key);
// Color(0xffFB6440),
  // Color(0xffFBAF40),
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        child: Column(
          children: [
            Image.asset('assets/burger.jpg'),
            Text(product.name!, style: const TextStyle(fontSize: 20,),),
            RichText(
              text:  TextSpan(
                text: 'R\$ ${product.price}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xffFB6440),
                ),
              
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                  child: GradientButtonWidget(
                    label: 'ADD',
                    gradient: const [
                      Color(0xff5F72E4),
                      Color(0xff805EE4),
                    ],
                    func: () {},
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove),
                ),
                const Text('1'),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
