import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_test/providers/cart_provider.dart';
import 'package:food_test/screens/order_failure.dart';
import 'package:food_test/screens/order_success.dart';
import 'package:food_test/widgets/cart_screen/checkout.dart';

class CheckoutButton extends ConsumerWidget {
  final double totalPrice;

  const CheckoutButton({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: ElevatedButton(
          onPressed: () => _showCheckoutBottomSheet(context, ref),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            minimumSize: const Size(double.infinity, 0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Go to Checkout',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(width: 12),
              Text(
                '\$${totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCheckoutBottomSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CheckoutBottomSheet(
        totalPrice: totalPrice,
        onPlaceOrder: () {
          Navigator.pop(context);
          _processOrder(context, ref);
        },
      ),
    );
  }

  void _processOrder(BuildContext context, WidgetRef ref) {
    final isSuccess = Random().nextDouble() < 0.7;

    if (isSuccess) {
      ref.read(cartProvider.notifier).clearCart();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const OrderSuccessScreen()),
        (route) => false,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OrderFailureScreen()),
      );
    }
  }
}
