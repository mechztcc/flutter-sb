import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sb/app/modules/category/controllers/category_store.dart';
import 'package:flutter_sb/app/modules/category/models/category_model.dart';

class ListCategoryWidget extends StatefulWidget {
  final String title;
  final double width;
  final double height;
  const ListCategoryWidget({
    Key? key,
    this.title = "ListCategoryWidget",
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  State<ListCategoryWidget> createState() => _ListCategoryWidgetState();
}

class _ListCategoryWidgetState extends State<ListCategoryWidget> {
  final CategoryStore categoryController = Modular.get();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: categoryController.listAll(7),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List<CategoryModel> data = snapshot.data as List<CategoryModel>;
          return SizedBox(
            width: widget.width,
            height: widget.height,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Container(
                      height: 35,
                      margin: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xff5F72E4),
                            Color(0xff805EE4),
                          ],
                        ),
                      ),
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            data[index].name,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                    ),
                  ],
                );
              },
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
