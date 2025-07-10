class Meal {
  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.image,
    required this.description,
    required this.price,
    this.isAvailable = true,
    this.rating = 0.0,
  });

  final String id;
  final List<String> categories;
  final String title;
  final String image;
  final String description;
  final double price;
  final bool isAvailable;
  final double rating;
}
