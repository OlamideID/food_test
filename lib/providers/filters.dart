import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_test/data/mockdata.dart';
import 'package:food_test/models/meal.dart';
import 'package:food_test/providers/search_provider.dart';

class FilterState {
  final Set<String> selectedCategories;
  final Set<String> selectedBrands;

  FilterState({
    Set<String>? selectedCategories,
    Set<String>? selectedBrands,
  }) : selectedCategories = selectedCategories ?? {},
        selectedBrands = selectedBrands ?? {};

  FilterState copyWith({
    Set<String>? selectedCategories,
    Set<String>? selectedBrands,
  }) {
    return FilterState(
      selectedCategories: selectedCategories ?? this.selectedCategories,
      selectedBrands: selectedBrands ?? this.selectedBrands,
    );
  }
}

class FilterNotifier extends StateNotifier<FilterState> {
  FilterNotifier() : super(FilterState());

  void toggleCategory(String categoryId) {
    final currentCategories = Set<String>.from(state.selectedCategories);
    if (currentCategories.contains(categoryId)) {
      currentCategories.remove(categoryId);
    } else {
      currentCategories.add(categoryId);
    }
    state = state.copyWith(selectedCategories: currentCategories);
  }

  void toggleBrand(String brand) {
    final currentBrands = Set<String>.from(state.selectedBrands);
    if (currentBrands.contains(brand)) {
      currentBrands.remove(brand);
    } else {
      currentBrands.add(brand);
    }
    state = state.copyWith(selectedBrands: currentBrands);
  }

  void clearAll() {
    state = FilterState();
  }
}

final filterProvider = StateNotifierProvider<FilterNotifier, FilterState>((ref) {
  return FilterNotifier();
});

final availableBrandsProvider = Provider<List<String>>((ref) {
  final Set<String> brands = {};
  
  brands.addAll([
    'Coca-Cola',
    'Pepsi',
    'Fanta',
    'Sprite',
    '7Up',
    'Maltina',
    'Individual Collection',
    'Nestle',
    'Kellogg\'s',
    'Doritos',
    'Pringles',
  ]);
  
  return brands.toList()..sort();
});

final filteredMealsProvider = Provider<List<Meal>>((ref) {
  final searchQuery = ref.watch(searchQueryProvider);
  final filterState = ref.watch(filterProvider);
  
  List<Meal> meals = List.from(dummyMeals);
  
  if (searchQuery.isNotEmpty) {
    meals = meals.where((meal) {
      return meal.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
             meal.description.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();
  }
  
  if (filterState.selectedCategories.isNotEmpty) {
    meals = meals.where((meal) {
      return meal.categories.any((category) => 
        filterState.selectedCategories.contains(category));
    }).toList();
  }
  
  if (filterState.selectedBrands.isNotEmpty) {
    meals = meals.where((meal) {
      return filterState.selectedBrands.any((brand) => 
        meal.title.toLowerCase().contains(brand.toLowerCase()));
    }).toList();
  }
  
  return meals;
});