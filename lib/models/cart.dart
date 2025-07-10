class CartItem {
  final String id;
  final String title;
  final String description;
  final String image;
  final double price;
  final int quantity;
  final double rating;

  const CartItem({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.quantity,
    required this.rating,
  });

  CartItem copyWith({
    String? id,
    String? title,
    String? description,
    String? image,
    double? price,
    int? quantity,
    double? rating,
  }) {
    return CartItem(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      rating: rating ?? this.rating,
    );
  }

  /// Convert CartItem to Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'price': price,
      'quantity': quantity,
      'rating': rating,
    };
  }

  /// Create CartItem from Map (JSON)
  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'],
      rating: (json['rating'] as num).toDouble(),
    );
  }
}
