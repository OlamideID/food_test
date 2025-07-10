import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_test/models/meal.dart';
import 'package:food_test/screens/food_details.dart';
import 'package:food_test/screens/see_all.dart';
import 'package:food_test/widgets/home/meal_card_content.dart';
import 'package:food_test/widgets/home/rating.dart';

class MealSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Meal> meals;
  // final IconData icon;
  final Color color;

  const MealSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.meals,
    // required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: title,
          subtitle: subtitle,

          color: color,
          meals: meals,
        ),
        const SizedBox(height: 12),
        MealHorizontalList(meals: meals),
      ],
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  // final IconData icon;
  final Color color;
  final List<Meal> meals;

  const SectionHeader({
    super.key,
    required this.title,
    required this.subtitle,
    // required this.icon,
    required this.color,
    required this.meals,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SeeAllScreen(title: title, meals: meals),
              ),
            );
          },
          style: TextButton.styleFrom(
            foregroundColor: color,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),

          child: const Text('See All'),
        ),
      ],
    );
  }
}

class MealHorizontalList extends StatelessWidget {
  final List<Meal> meals;

  const MealHorizontalList({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        itemCount: meals.length,
        itemBuilder: (ctx, index) {
          final meal = meals[index];
          return MealCard(meal: meal);
        },
      ),
    );
  }
}

class MealCard extends StatelessWidget {
  final Meal meal;

  const MealCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => MealDetailScreen(meal: meal)),
            );
          },
          child: Container(
            width: 180,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MealCardImage(meal: meal),
                MealCardContent(meal: meal),
              ],
            ),
          ),
        );
      },
    );
  }
}

// Meal card image widget
class MealCardImage extends StatelessWidget {
  final Meal meal;

  const MealCardImage({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: Stack(
        children: [
          Image.network(
            meal.image,
            height: 140,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              height: 140,
              color: Colors.grey.shade200,
              child: const Icon(
                Icons.image_not_supported,
                color: Colors.grey,
                size: 40,
              ),
            ),
          ),
          Positioned(top: 8, right: 8, child: RatingBadge(rating: meal.rating)),
        ],
      ),
    );
  }
}
