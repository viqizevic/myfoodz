import 'package:flutter/material.dart';
import 'package:myfoodz/models/category.dart';
import 'package:myfoodz/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Category> availableCategories;

  CategoriesScreen(this.availableCategories);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: availableCategories.map((catData) {
        return CategoryItem(
          id: catData.id,
          title: catData.title,
          color: catData.color,
        );
      }).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
