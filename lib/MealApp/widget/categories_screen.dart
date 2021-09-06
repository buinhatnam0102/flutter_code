import 'package:flutter/material.dart';
import 'package:flutter_xxx/MealApp/widget/category_item.dart';
import 'package:flutter_xxx/MealApp/data/dummy_data.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      child: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: DUMMY_CATEGORIES
              .map((catData) =>
                  CategoryItem(catData.id, catData.title, catData.color))
              .toList()),
    );
  }
}
