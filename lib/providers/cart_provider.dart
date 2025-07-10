import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/cart.dart';
import '../models/meal.dart';

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>(
  (ref) => CartNotifier(),
);

final cartTotalProvider = Provider<double>((ref) {
  final cart = ref.watch(cartProvider);
  return cart.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
});

final cartItemCountProvider = Provider<int>((ref) {
  return ref.watch(cartProvider).fold(0, (sum, item) => sum + item.quantity);
});

class CartNotifier extends StateNotifier<List<CartItem>> {
  static const _cartKey = 'user_cart';

  CartNotifier() : super([]) {
    _loadCart();
  }

  Future<void> _loadCart() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cartString = prefs.getString(_cartKey);
      if (cartString != null) {
        final List decoded = jsonDecode(cartString);
        state = decoded.map((item) => CartItem.fromJson(item)).toList();
      }
    } catch (e) {
      print('Error loading cart: $e');
    }
  }

  Future<void> _saveCart() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cartJson = jsonEncode(state.map((item) => item.toJson()).toList());
      await prefs.setString(_cartKey, cartJson);
    } catch (e) {
      print('Error saving cart: $e');
    }
  }

  void addToCart(Meal meal, {int quantity = 1}) {
    final existingIndex = state.indexWhere((item) => item.id == meal.id);

    if (existingIndex >= 0) {
      state = [
        for (int i = 0; i < state.length; i++)
          if (i == existingIndex)
            state[i].copyWith(quantity: state[i].quantity + quantity)
          else
            state[i],
      ];
    } else {
      final cartItem = CartItem(
        id: meal.id,
        title: meal.title,
        description: meal.description,
        image: meal.image,
        price: meal.price,
        quantity: quantity,
        rating: meal.rating,
      );
      state = [...state, cartItem];
    }
    _saveCart();
  }

  void removeFromCart(String mealId) {
    state = state.where((item) => item.id != mealId).toList();
    _saveCart();
  }

  void updateQuantity(String mealId, int newQuantity) {
    if (newQuantity <= 0) {
      removeFromCart(mealId);
      return;
    }
    state = [
      for (final item in state)
        if (item.id == mealId) item.copyWith(quantity: newQuantity) else item,
    ];
    _saveCart();
  }

  void decreaseQuantity(String mealId) {
    final item = state.firstWhere((item) => item.id == mealId);
    if (item.quantity > 1) {
      updateQuantity(mealId, item.quantity - 1);
    } else {
      removeFromCart(mealId);
    }
  }

  void increaseQuantity(String mealId) {
    final item = state.firstWhere((item) => item.id == mealId);
    updateQuantity(mealId, item.quantity + 1);
  }

  void clearCart() {
    state = [];
    _saveCart();
  }
}