import 'package:flutter/material.dart';
import 'package:food_test/helpers/to_meal.dart';
import 'package:food_test/models/cart.dart';
import 'package:food_test/screens/food_details.dart';

class CartItemCard extends StatelessWidget {
  final CartItem item;
  final VoidCallback onRemove;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;

  const CartItemCard({
    super.key,
    required this.item,
    required this.onRemove,
    required this.onDecrease,
    required this.onIncrease,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MealDetailScreen(meal: item.toMeal()),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            _buildItemImage(),
            const SizedBox(width: 16),
            Expanded(
              child: _buildItemDetails(),
            ),
            _buildItemActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildItemImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        item.image,
        width: 60,
        height: 60,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          width: 60,
          height: 60,
          color: Colors.grey.shade200,
          child: const Icon(
            Icons.image_not_supported,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildItemDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          item.description,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.grey.shade600),
        ),
        const SizedBox(height: 12),
        _buildQuantityControls(),
      ],
    );
  }

  Widget _buildQuantityControls() {
    return Row(
      children: [
        InkWell(
          onTap: onDecrease,
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: const Icon(Icons.remove, size: 16),
          ),
        ),
        const SizedBox(width: 16),
        Text(item.quantity.toString()),
        const SizedBox(width: 16),
        InkWell(
          onTap: onIncrease,
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(),
            ),
            child: const Icon(
              Icons.add,
              size: 16,
              color: Colors.green,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildItemActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        InkWell(
          onTap: onRemove,
          child: const Icon(Icons.close, size: 20, color: Colors.grey),
        ),
        const SizedBox(height: 8),
        Text(
          '\$${(item.price * item.quantity).toStringAsFixed(2)}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}