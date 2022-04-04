import 'package:flutter/material.dart';
import 'package:flutter_sb/app/modules/foodstore/models/foodstore_model.dart';
import 'package:flutter_sb/app/modules/user/components/gradient_button_widget.dart';

class CardFoodstoreListWidget extends StatelessWidget {
  final String title;
  final FoodstoreModel foodstore;

  const CardFoodstoreListWidget(
      {Key? key,
      this.title = "CardFoodstoreListWidget",
      required this.foodstore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              SizedBox(
                height: 100,
                child: Image.asset('assets/burg.png'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodstore.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Text(foodstore.city),
                  Text(foodstore.state),
                  Text(foodstore.number),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 10),
                  //   child: Row(
                  //     children: [
                  //       SizedBox(
                  //         height: 40,
                  //         child: GradientButtonWidget(
                  //           label: 'ADD',
                  //           gradient: const [
                  //             Color(0xff5F72E4),
                  //             Color(0xff805EE4),
                  //           ],
                  //           func: () {},
                  //         ),
                  //       ),
                  //       IconButton(
                  //         onPressed: () {},
                  //         icon: const Icon(Icons.remove),
                  //       ),
                  //       const Text('1'),
                  //       IconButton(
                  //         onPressed: () {},
                  //         icon: const Icon(Icons.add),
                  //       )
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
