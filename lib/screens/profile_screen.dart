import 'package:flutter/material.dart';
import 'package:food_test/widgets/auth.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Header
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/150?img=3',
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Afsar Hossen',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(Icons.edit, size: 16, color: Colors.green),
                            ],
                          ),
                          Text(
                            'lmshuvo97@gmail.com',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const Divider(),

              // Profile Options
              const _ProfileOption(
                icon: Icons.shopping_bag_outlined,
                label: 'Orders',
              ),
              const Divider(),

              const _ProfileOption(
                icon: Icons.person_outline,
                label: 'My Details',
              ),
              const Divider(),

              const _ProfileOption(
                icon: Icons.location_on_outlined,
                label: 'Delivery Address',
              ),
              const Divider(),

              const _ProfileOption(
                icon: Icons.payment_outlined,
                label: 'Payment Methods',
              ),
              const Divider(),

              const _ProfileOption(
                icon: Icons.card_giftcard_outlined,
                label: 'Promo Cord',
              ),
              const Divider(),

              const _ProfileOption(
                icon: Icons.notifications_none,
                label: 'Notifications',
              ),
              const Divider(),

              const _ProfileOption(icon: Icons.help_outline, label: 'Help'),
              const Divider(),

              const _ProfileOption(icon: Icons.info_outline, label: 'About'),
              const Divider(),

              const SizedBox(height: 40),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return AuthWrapper();
                        },
                      ),
                    );
                  },
                  icon: const Icon(Icons.logout, color: Colors.green),
                  label: const Text(
                    'Log Out',
                    style: TextStyle(color: Colors.green),
                  ),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    side: const BorderSide(color: Colors.green),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileOption extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ProfileOption({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Text(label, style: const TextStyle(fontSize: 15)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}
