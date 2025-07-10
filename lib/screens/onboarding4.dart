import 'package:flutter/material.dart';
import 'package:food_test/widgets/auth.dart';

class LocationSelectionScreen extends StatefulWidget {
  const LocationSelectionScreen({super.key});

  @override
  State<LocationSelectionScreen> createState() =>
      _LocationSelectionScreenState();
}

class _LocationSelectionScreenState extends State<LocationSelectionScreen> {
  String? selectedZone;
  String? selectedArea;

  final List<String> zones = [
    'Abuja Municipal',
    'Gwagwalada',
    'Kuje',
    'Abaji',
    'Kwali',
    'Bwari',
  ];

  final Map<String, List<String>> areasByZone = {
    'Abuja Municipal': [
      'Garki',
      'Wuse',
      'Maitama',
      'Asokoro',
      'Central Business District',
      'Utako',
      'Jabi',
      'Gwarinpa',
    ],
    'Gwagwalada': ['Gwagwalada Town', 'Kutunku', 'Dobi', 'Zuba', 'Paiko'],
    'Kuje': ['Kuje Town', 'Rubochi', 'Gudun Karya', 'Yaba'],
    'Abaji': ['Abaji Town', 'Pandogari', 'Rimba', 'Gawu'],
    'Kwali': ['Kwali Town', 'Kilankwa', 'Ashara', 'Lambata'],
    'Bwari': ['Bwari Town', 'Kubwa', 'Dutse', 'Byazhin', 'Dei-Dei'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    width: 200,
                    height: 150,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/illustration.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Select Your Location',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Switch on your location to stay in tune with\nwhat\'s happening in your area',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 40),

                  /// ZONE DROPDOWN
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Your Zone',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedZone,
                            hint: const Text(
                              'Select your zone',
                              style: TextStyle(color: Colors.grey),
                            ),
                            isExpanded: true,
                            items: zones.map((String zone) {
                              return DropdownMenuItem<String>(
                                value: zone,
                                child: Text(zone),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedZone = newValue;
                                selectedArea = null;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  /// AREA DROPDOWN
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Your Area',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            key: ValueKey(selectedZone),
                            value: selectedArea,
                            hint: const Text(
                              'Types of your area',
                              style: TextStyle(color: Colors.grey),
                            ),
                            isExpanded: true,
                            items:
                                (selectedZone != null &&
                                    areasByZone[selectedZone] != null)
                                ? areasByZone[selectedZone]!.map((String area) {
                                    return DropdownMenuItem<String>(
                                      value: area,
                                      child: Text(area),
                                    );
                                  }).toList()
                                : [],
                            onChanged: selectedZone != null
                                ? (String? newValue) {
                                    setState(() {
                                      selectedArea = newValue;
                                    });
                                  }
                                : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              width: double.infinity,
              height: 56,
              margin: const EdgeInsets.only(bottom: 24),
              child: ElevatedButton(
                onPressed: selectedZone != null && selectedArea != null
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return AuthWrapper();
                            },
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
