import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_test/data/mockdata.dart';
import 'package:food_test/models/meal.dart';
import 'package:food_test/widgets/home/meal_section.dart';
import 'package:food_test/widgets/home/welcome_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  List<Meal> _searchResults = [];

  List<Meal> getRandomMeals(int count) {
    final random = Random();
    final shuffled = List<Meal>.from(dummyMeals)..shuffle(random);
    return shuffled.take(count).toList();
  }

  void _handleSearch(String query) {
    setState(() {
      _searchQuery = query.trim().toLowerCase();
      _searchResults = dummyMeals
          .where(
            (meal) =>
                meal.title.toLowerCase().contains(_searchQuery) ||
                meal.description.toLowerCase().contains(_searchQuery),
          )
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final exclusiveOffers = getRandomMeals(8);
    final bestSelling = getRandomMeals(8);
    final groceries = getRandomMeals(8);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(160),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 8),
              Image.asset(
                'assets/Group.png',
                height: 36,
              ),

              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.location_on, color: Colors.grey, size: 18),
                  SizedBox(width: 4),
                  Text(
                    'Dhaka, Banassre',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: Colors.black45),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          onChanged: _handleSearch,
                          decoration: const InputDecoration(
                            hintText: 'Search Store',
                            hintStyle: TextStyle(color: Colors.black45),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      if (_searchQuery.isNotEmpty)
                        IconButton(
                          icon: const Icon(Icons.clear, size: 20),
                          onPressed: () {
                            _searchController.clear();
                            _handleSearch('');
                          },
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: _searchQuery.isNotEmpty
            ? MealSection(
                title: 'Search Results',
                subtitle: '${_searchResults.length} item(s) found',
                meals: _searchResults,
                color: Colors.deepPurple,
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const WelcomeSection(),
                  const SizedBox(height: 24),
                  MealSection(
                    title: 'Exclusive Offers',
                    subtitle: 'Special deals just for you',
                    meals: exclusiveOffers,
                    color: Colors.green,
                  ),
                  const SizedBox(height: 24),
                  MealSection(
                    title: 'Best Selling',
                    subtitle: 'Popular items this week',
                    meals: bestSelling,
                    color: Colors.green,
                  ),
                  const SizedBox(height: 24),
                  MealSection(
                    title: 'Groceries',
                    subtitle: 'Fresh daily essentials',
                    meals: groceries,
                    color: Colors.green,
                  ),
                ],
              ),
      ),
    );
  }
}
