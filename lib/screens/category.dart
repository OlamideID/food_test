import 'package:flutter/material.dart';
import 'package:food_test/data/mockdata.dart';
import 'package:food_test/models/category.dart';
import 'package:food_test/widgets/meal_card.dart';

class CategoryScreen extends StatelessWidget {
  final Category category;

  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final categoryMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text(category.title), elevation: 0),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green.shade50, Colors.white],
          ),
        ),
        child: categoryMeals.isEmpty
            ? const Center(
                child: Text(
                  'No items available in this category',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: categoryMeals.length,
                  itemBuilder: (context, index) {
                    final meal = categoryMeals[index];
                    return DetailedMealCard(meal: meal);
                  },
                ),
              ),
      ),
    );
  }
}
