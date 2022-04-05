import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sb/app/modules/product/controller/bag_store.dart';
import 'package:flutter_sb/app/modules/product/models/product_model.dart';
import 'package:flutter_sb/app/modules/user/components/gradient_button_widget.dart';

class CardProductWidget extends StatefulWidget {
  final String title;
  final ProductModel product;
  const CardProductWidget({
    Key? key,
    this.title = "CardProductWidget",
    required this.product,
  }) : super(key: key);

  @override
  State<CardProductWidget> createState() => _CardProductWidgetState();
}

class _CardProductWidgetState extends State<CardProductWidget> {
  final BagStore bagController = Modular.get();

  int qty = 0;

  bool isLoading = false;

  void incrementQty() {
    setState(() {
      qty += 1;
    });
  }

  void decrementQty() {
    setState(() {
      qty > 0 ? qty -= 1 : qty = 0;
    });
  }

  void addProduct(ProductModel product) {
    bagController.addProduct(product);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Modular.to.pushNamed('/product/details/${widget.product.id}');
      },
      child: SizedBox(
        width: 200,
        child: Card(
          child: Column(
            children: [
              Image.asset('assets/burger.jpg'),
              Text(
                widget.product.name!,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'R\$ ${widget.product.price}',
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
                      label: !isLoading ? 'ADD' : '...',
                      gradient: const [
                        Color(0xff5F72E4),
                        Color(0xff805EE4),
                      ],
                      func: () {
                        addProduct(widget.product);
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      decrementQty();
                    },
                    icon: const Icon(Icons.remove),
                  ),
                  Text('$qty'),
                  IconButton(
                    onPressed: () {
                      incrementQty();
                    },
                    icon: const Icon(Icons.add),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
