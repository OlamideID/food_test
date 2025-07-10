import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final favoritesProvider = StateNotifierProvider<FavoritesNotifier, Set<String>>(
  (ref) => FavoritesNotifier(),
);

class FavoritesNotifier extends StateNotifier<Set<String>> {
  static const _prefsKey = 'favorite_meals';

  FavoritesNotifier() : super({}) {
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString(_prefsKey);
      if (jsonString != null) {
        final List decoded = jsonDecode(jsonString);
        state = decoded.cast<String>().toSet();
      }
    } catch (e) {
      print('Error loading favorites: $e');
    }
  }

  Future<void> _saveFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = jsonEncode(state.toList());
      await prefs.setString(_prefsKey, jsonString);
    } catch (e) {
      print('Error saving favorites: $e');
    }
  }

  void toggleFavorite(String mealId) {
    if (state.contains(mealId)) {
      state = {...state}..remove(mealId);
    } else {
      state = {...state}..add(mealId);
    }
    _saveFavorites();
  }

  bool isFavorite(String mealId) => state.contains(mealId);
}
