import 'package:flutter/material.dart';

class CheckoutBottomSheet extends StatefulWidget {
  final double totalPrice;
  final VoidCallback onPlaceOrder;

  const CheckoutBottomSheet({
    super.key,
    required this.totalPrice,
    required this.onPlaceOrder,
  });

  @override
  State<CheckoutBottomSheet> createState() => _CheckoutBottomSheetState();
}

class _CheckoutBottomSheetState extends State<CheckoutBottomSheet> {
  String selectedPaymentMethod = 'Credit Card';
  String promoCode = '';
  double discount = 0.0;

  @override
  Widget build(BuildContext context) {
    final discountedTotal = widget.totalPrice - discount;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 20),
          _buildDeliverySection(),
          const SizedBox(height: 16),
          _buildPaymentSection(),
          const SizedBox(height: 16),
          _buildPromoCodeSection(),
          const SizedBox(height: 20),
          _buildTotalCostSection(discountedTotal),
          const SizedBox(height: 20),
          _buildTermsAndConditions(),
          const SizedBox(height: 20),
          _buildPlaceOrderButton(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Checkout',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
          iconSize: 20,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ],
    );
  }

  Widget _buildDeliverySection() {
    return _buildSection(
      title: 'Delivery',
      subtitle: 'Select Method',
      icon: Icons.local_shipping_outlined,
      onTap: _showDeliveryMethodDialog,
    );
  }

  Widget _buildPaymentSection() {
    return _buildSection(
      title: 'Payment',
      subtitle: selectedPaymentMethod,
      icon: Icons.credit_card,
      onTap: _showPaymentMethodDialog,
    );
  }

  Widget _buildPromoCodeSection() {
    return _buildSection(
      title: 'Promo Code',
      subtitle: promoCode.isEmpty ? 'Pick discount' : promoCode,
      icon: Icons.local_offer_outlined,
      onTap: _showPromoCodeDialog,
    );
  }

  Widget _buildTotalCostSection(double discountedTotal) {
    return _buildSection(
      title: 'Total Cost',
      subtitle: '\$${discountedTotal.toStringAsFixed(2)}',
      icon: Icons.receipt_outlined,
      showArrow: false,
      subtitleStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    );
  }

  Widget _buildTermsAndConditions() {
    return const Text(
      'By placing an order you agree to our\nTerms and Conditions',
      style: TextStyle(fontSize: 12, color: Colors.grey, height: 1.4),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildPlaceOrderButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: widget.onPlaceOrder,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4CAF50),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: const Text(
          'Place Order',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String subtitle,
    required IconData icon,
    VoidCallback? onTap,
    bool showArrow = true,
    TextStyle? subtitleStyle,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
        child: Row(
          children: [
            Icon(icon, size: 20, color: Colors.grey.shade600),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: subtitleStyle ??
                        TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade800,
                        ),
                  ),
                ],
              ),
            ),
            if (showArrow && onTap != null)
              Icon(
                Icons.arrow_forward_ios,
                size: 14,
                color: Colors.grey.shade500,
              ),
          ],
        ),
      ),
    );
  }

  void _showDeliveryMethodDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Delivery Method'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: ['Standard Delivery', 'Express Delivery', 'Pickup']
              .map(
                (method) => ListTile(
                  title: Text(method),
                  leading: Radio<String>(
                    value: method,
                    groupValue: 'Standard Delivery',
                    onChanged: (value) {
                      Navigator.pop(context);
                    },
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  void _showPaymentMethodDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Payment Method'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: ['Credit Card', 'PayPal', 'Apple Pay', 'Google Pay']
              .map(
                (method) => ListTile(
                  title: Text(method),
                  leading: Radio<String>(
                    value: method,
                    groupValue: selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() => selectedPaymentMethod = value!);
                      Navigator.pop(context);
                    },
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  void _showPromoCodeDialog() {
    final controller = TextEditingController(text: promoCode);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Enter Promo Code'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Enter promo code',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final code = controller.text.trim();
              setState(() {
                promoCode = code;
                if (code.toLowerCase() == 'save10') {
                  discount = widget.totalPrice * 0.1;
                } else if (code.toLowerCase() == 'welcome') {
                  discount = 5.0;
                } else {
                  discount = 0.0;
                }
              });
              Navigator.pop(context);
            },
            child: const Text('Apply'),
          ),
        ],
      ),
    );
  }
}