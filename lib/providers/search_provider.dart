import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_test/data/mockdata.dart';
import 'package:food_test/models/meal.dart';

// Search query provider
final searchQueryProvider = StateProvider<String>((ref) => '');

// Enhanced search results provider with category matching
final searchResultsProvider = Provider<List<Meal>>((ref) {
  final query = ref.watch(searchQueryProvider);
  if (query.isEmpty) return [];

  final lowercaseQuery = query.toLowerCase();
  return dummyMeals.where((meal) {
    // Search in title and description
    bool titleMatch = meal.title.toLowerCase().contains(lowercaseQuery);
    bool descriptionMatch = meal.description.toLowerCase().contains(
      lowercaseQuery,
    );

    // Search in categories
    bool categoryMatch = meal.categories.any((categoryId) {
      final category = availableCategories.firstWhere(
        (cat) => cat.id == categoryId,
        orElse: () => availableCategories.first,
      );
      return category.title.toLowerCase().contains(lowercaseQuery);
    });

    return titleMatch || descriptionMatch || categoryMatch;
  }).toList();
});
