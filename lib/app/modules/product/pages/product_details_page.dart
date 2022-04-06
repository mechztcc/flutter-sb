import 'package:flutter/material.dart';
import 'package:flutter_sb/app/modules/user/components/gradient_button_widget.dart';

class ProductDetailsPage extends StatefulWidget {
  final String title;
  final String id;
  const ProductDetailsPage(
      {Key? key, this.title = 'ProductDetailsPage', required this.id})
      : super(key: key);
  @override
  ProductDetailsPageState createState() => ProductDetailsPageState();
}

class ProductDetailsPageState extends State<ProductDetailsPage> {
  final List<Color> gradient = const [Color(0xff5F72E4), Color(0xff805EE4)];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: LayoutBuilder(
        builder: ((context, constraints) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset('assets/burguer2.jpg'),
                  ),
                  Row(
                    children: const [
                      Icon(Icons.star_rounded, color: Color(0xffFB6440), size: 30),
                      Icon(Icons.star_rounded, color: Color(0xffFB6440), size: 30),
                      Icon(Icons.star_rounded, color: Color(0xffFB6440), size: 30),
                      Icon(Icons.star_rounded, color: Color(0xffFB6440), size: 30),
                      Icon(Icons.star_border_rounded, color: Color(0xffFB6440), size: 30),
                      Text('(225)', style: TextStyle(color: Color(0xffFB6440)))
                    ],
                  ),
                  Column(
                    children: const [
                      Text(
                        'Descrição',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: const TextSpan(
                            text: 'R\$ 22.00',
                            style: TextStyle(
                                color: Color(0xffFB6440),
                                fontSize: 35,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        width: constraints.maxWidth * 0.5,
                        child: GradientButtonWidget(
                          label: 'Adicionar',
                          gradient: gradient,
                          func: () {},
                        ),
                      )
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
