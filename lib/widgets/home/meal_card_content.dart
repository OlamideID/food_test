import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_test/models/meal.dart';
import 'package:food_test/widgets/home/button.dart';

class MealCardContent extends StatelessWidget {
  final Meal meal;

  const MealCardContent({
    super.key,
    required this.meal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              meal.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            SizedBox(
              height: 32,
              child: Text(
                meal.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                  height: 1.3,
                ),
              ),
            ),
            const SizedBox(height: 8),
            MealCardFooter(meal: meal),
          ],
        ),
      ),
    );
  }
}

class MealCardFooter extends StatelessWidget {
  final Meal meal;

  const MealCardFooter({
    super.key,
    required this.meal,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Row(
          children: [
            Text(
              '\$${meal.price.toStringAsFixed(2)}',
              style: const TextStyle(
                color: Colors.green,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            AddToCartButton(meal: meal),
          ],
        );
      },
    );
  }
}