import 'package:food_test/models/cart.dart';
import 'package:food_test/models/meal.dart';

extension CartItemMapper on CartItem {
  Meal toMeal() {
    return Meal(
      id: id,
      title: title,
      description: description,
      image: image,
      price: price,
      rating: rating,
      categories: [],
    );
  }
}
