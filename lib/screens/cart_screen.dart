import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_test/providers/cart_provider.dart';
import 'package:food_test/widgets/cart_screen/button.dart';
import 'package:food_test/widgets/cart_screen/cart_item.dart';
import 'package:food_test/widgets/cart_screen/empty_cart.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    final totalPrice = ref.watch(cartTotalProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: cartItems.isEmpty
          ? const EmptyCartWidget()
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return CartItemCard(
                        item: item,
                        onRemove: () => ref
                            .read(cartProvider.notifier)
                            .removeFromCart(item.id),
                        onDecrease: () => ref
                            .read(cartProvider.notifier)
                            .decreaseQuantity(item.id),
                        onIncrease: () => ref
                            .read(cartProvider.notifier)
                            .increaseQuantity(item.id),
                      );
                    },
                  ),
                ),
                CheckoutButton(totalPrice: totalPrice),
              ],
            ),
    );
  }
}
