import 'package:flutter/material.dart';

import '../widgets/category_item.dart';
import '../models/dummy-data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES.map((cateData) => CategoryItem(cateData.id, cateData.title, cateData.color)).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 3 / 2,
      ),
    );
  }
}
