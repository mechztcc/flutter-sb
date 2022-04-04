import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sb/app/modules/category/controllers/category_store.dart';
import 'package:flutter_sb/app/modules/category/models/category_model.dart';

class ListCategoryWidget extends StatefulWidget {
  final String title;
  const ListCategoryWidget({Key? key, this.title = "ListCategoryWidget"})
      : super(key: key);

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
        List<CategoryModel> data = snapshot.data as List<CategoryModel>;
        if (snapshot.connectionState == ConnectionState.done) {
          return SizedBox(
            width: 600,
            height: 200,
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    SizedBox(
                      height: 25,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(data[index].name),
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
                      ),
                    )
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
