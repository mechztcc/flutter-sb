import 'package:flutter/material.dart';
import 'package:flutter_sb/app/modules/user/components/gradient_button_widget.dart';

class CardProductWidget extends StatelessWidget {
  final String title;
  const CardProductWidget({Key? key, this.title = "CardProductWidget"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: Card(
        child: Column(
          children: [
            Image.asset('assets/burger.jpg'),
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
