import 'package:flutter/material.dart';
import 'package:food_test/data/mockdata.dart';
import 'package:food_test/models/coutry.dart';
import 'package:food_test/screens/onboarding3.dart';

class MobileNumberScreen extends StatefulWidget {
  const MobileNumberScreen({super.key});

  @override
  State<MobileNumberScreen> createState() => _MobileNumberScreenState();
}

class _MobileNumberScreenState extends State<MobileNumberScreen> {
  final TextEditingController _controller = TextEditingController();

  Country selectedCountry = Country(
    name: 'Bangladesh',
    code: '+880',
    flag: 'https://flagcdn.com/w320/bd.png',
  );

  void _onContinue() {
    final phoneNumber = _controller.text;
    if (phoneNumber.isNotEmpty) {
      print('Phone number: ${selectedCountry.code}$phoneNumber');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const VerificationCodeScreen()),
      );
    }
  }

  void _showCountryPicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Text(
                    'Select Country',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: ListView.builder(
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  final country = countries[index];
                  return ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.network(
                        country.flag,
                        width: 32,
                        height: 24,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: Colors.grey[300],
                          child: const Icon(Icons.flag, size: 16),
                        ),
                      ),
                    ),
                    title: Text(country.name),
                    trailing: Text(
                      country.code,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    onTap: () {
                      setState(() => selectedCountry = country);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF5E6FF), Color(0xFFE6F3FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Back button
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios, size: 20),
                    ),
                  ],
                ),
              ),

              // Title and Input
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        'Enter your mobile number',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        'Mobile Number',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Phone input with country code
                      TextField(
                        controller: _controller,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          prefixIcon: InkWell(
                            onTap: _showCountryPicker,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(width: 8),
                                Image.network(
                                  selectedCountry.flag,
                                  width: 24,
                                  height: 16,
                                  errorBuilder: (_, __, ___) =>
                                      const Icon(Icons.flag, size: 16),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  selectedCountry.code,
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const Icon(Icons.arrow_drop_down),
                                const SizedBox(width: 8),
                              ],
                            ),
                          ),
                          hintText: 'Enter phone number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: FloatingActionButton(
                          shape: CircleBorder(),
                          onPressed: _onContinue,
                          backgroundColor: const Color(0xFF53B175),
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
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
