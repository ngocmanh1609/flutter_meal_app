import 'package:flutter/material.dart';

import '../models/dummy-data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeNamed = '/meal-detail';

  Widget buildContainerTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainerList(Widget child) {
    return Container(
        margin: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 150,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == mealId;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildContainerTitle(context, 'Ingredients'),
            buildContainerList(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Colors.amber,
                  child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(selectedMeal.ingredients[index])),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildContainerTitle(context, 'Steps'),
            buildContainerList(ListView.builder(
              itemBuilder: (ctx, index) => Column(children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    child: Text("# ${index + 1}"),
                  ),
                  title: Text(selectedMeal.steps[index]),
                ),
                Divider(),
              ]),
              itemCount: selectedMeal.steps.length,
            ))
          ],
        ),
      ),
    );
  }
}
