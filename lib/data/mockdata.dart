import 'package:food_test/models/category.dart';
import 'package:food_test/models/coutry.dart';
import 'package:food_test/models/meal.dart';

const availableCategories = [
  Category(
    id: 'c1',
    title: 'Beverages',
    image:
        'https://images.unsplash.com/photo-1544145945-f90425340c7e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80',
  ),
  Category(
    id: 'c2',
    title: 'Oil and Ghee',
    image:
        'https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80',
  ),
  Category(
    id: 'c3',
    title: 'Fresh Fruits and Vegetables',
    image:
        'https://images.unsplash.com/photo-1540420773420-3366772f4999?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80',
  ),
  Category(
    id: 'c4',
    title: 'Bakery and Snacks',
    image:
        'https://images.unsplash.com/photo-1509440159596-0249088772ff?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80',
  ),
  Category(
    id: 'c5',
    title: 'Dairy and Eggs',
    image:
        'https://images.unsplash.com/photo-1550583724-b2692b85b150?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
  ),
  Category(
    id: 'c6',
    title: 'Meat and Fish',
    image:
        'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80',
  ),
];

const dummyMeals = [
  // Beverages
  Meal(
    id: 'm1',
    categories: ['c1'],
    title: 'Coca-Cola',
    image:
        'https://images.unsplash.com/photo-1554866585-cd94860890b7?w=300&h=300&fit=crop',
    description:
        'Classic fizzy Coca-Cola soft drink made with natural flavors and premium ingredients. This iconic beverage delivers the perfect balance of sweetness and refreshment. Best served chilled over ice for maximum enjoyment. Contains caffeine for an extra boost of energy. Perfect for parties, meals, or any time you need a refreshing drink.',
    price: 1.50,
    rating: 4.8,
  ),
  Meal(
    id: 'm2',
    categories: ['c1'],
    title: 'Fanta',
    image:
        'https://images.unsplash.com/photo-1624552590142-4aea342b8e85?w=300&h=300&fit=crop',
    description:
        'Refreshing orange-flavored carbonated soft drink bursting with citrus goodness. Made with real orange juice and natural flavors, this vibrant beverage offers a sweet and tangy taste that delights the senses. Perfect for hot days, social gatherings, or as a treat with your favorite meal. Contains no artificial colors and is made with quality ingredients.',
    price: 1.40,
    rating: 4.5,
  ),
  Meal(
    id: 'm3',
    categories: ['c1'],
    title: 'Sprite',
    image:
        'https://images.unsplash.com/photo-1629203851122-3726ecdf080e?w=300&h=300&fit=crop',
    description:
        'Lemon-lime flavored soda with a crisp, clean taste that cuts through any thirst. This clear, caffeine-free beverage combines the zesty flavors of lemon and lime with sparkling water for a refreshing experience. Perfect as a mixer for cocktails or enjoyed on its own. Great for settling the stomach and providing instant refreshment.',
    price: 1.40,
    rating: 4.4,
  ),
  Meal(
    id: 'm4',
    categories: ['c1'],
    title: 'Pepsi',
    image:
        'https://images.unsplash.com/photo-1629203849421-7795551ad8b4?w=300&h=300&fit=crop',
    description:
        'Bold taste and refreshing cola flavor that delivers maximum refreshment. This premium cola beverage is crafted with a unique blend of natural flavors and spices that create its distinctive taste. Contains caffeine for energy and alertness. Perfect for meals, parties, or whenever you need a bold, refreshing drink that satisfies.',
    price: 1.45,
    rating: 4.6,
  ),
  Meal(
    id: 'm5',
    categories: ['c1'],
    title: '7Up',
    image:
        'https://images.unsplash.com/photo-1544145945-f90425340c7e?w=300&h=300&fit=crop',
    description:
        'Crisp and clean lemon-lime flavored soda with natural citrus oils for authentic taste. This caffeine-free beverage offers a light, refreshing experience with just the right amount of fizz. Made with no artificial flavors, it provides a pure, clean taste that refreshes without being too sweet. Perfect for any occasion.',
    price: 1.40,
    rating: 4.3,
  ),
  Meal(
    id: 'm6',
    categories: ['c1'],
    title: 'Maltina',
    image:
        'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=300&h=300&fit=crop',
    description:
        'Nutritious malt drink packed with energy and rich flavor. This premium non-alcoholic beverage is made from carefully selected malted barley and fortified with essential vitamins and minerals. Provides sustained energy and nutrition, making it perfect for active lifestyles. Rich, creamy texture with a distinctive malty taste that both adults and children love.',
    price: 1.60,
    rating: 4.7,
  ),

  // Oil and Ghee
  Meal(
    id: 'm7',
    categories: ['c2'],
    title: 'Vegetable Oil',
    image:
        'https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?w=300&h=300&fit=crop',
    description:
        'Multi-purpose cooking oil suitable for frying, baking, and sautéing. This refined vegetable oil has a neutral taste and high smoke point, making it ideal for all cooking methods. Rich in essential fatty acids and vitamin E. Perfect for deep frying, stir-frying, baking cakes, and making salad dressings. Cholesterol-free and heart-healthy option for your kitchen.',
    price: 6.50,
    rating: 4.5,
  ),
  Meal(
    id: 'm8',
    categories: ['c2'],
    title: 'Palm Oil',
    image:
        'https://images.unsplash.com/photo-1599929765623-d0b70667d5a4?w=300&h=300&fit=crop',
    description:
        'Traditional red palm oil used extensively in African and Asian cooking. This unrefined oil is rich in beta-carotene and vitamin E, giving it its distinctive red color and nutritional benefits. Essential for authentic African dishes like jollof rice, egusi soup, and palm nut soup. Adds unique flavor and color to traditional recipes.',
    price: 5.80,
    rating: 4.6,
  ),
  Meal(
    id: 'm9',
    categories: ['c2'],
    title: 'Groundnut Oil',
    image:
        'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=300&h=300&fit=crop',
    description:
        'Rich and healthy oil extracted from premium peanuts through cold-press method. This oil has a mild nutty flavor and high smoke point, making it excellent for deep frying and high-heat cooking. Rich in monounsaturated fats and vitamin E. Perfect for African cuisine, Asian stir-fries, and general cooking. Adds subtle nutty flavor to dishes.',
    price: 6.90,
    rating: 4.5,
  ),
  Meal(
    id: 'm10',
    categories: ['c2'],
    title: 'Sunflower Oil',
    image:
        'https://images.unsplash.com/photo-1593165698971-3c9b54f4c28c?w=300&h=300&fit=crop',
    description:
        'Light and healthy cooking oil with high vitamin E content and neutral flavor. This premium oil is extracted from sunflower seeds and refined to perfection. Has a high smoke point making it ideal for frying and baking. Low in saturated fats and rich in antioxidants. Perfect for health-conscious cooking and suitable for all dietary requirements.',
    price: 7.20,
    rating: 4.4,
  ),
  Meal(
    id: 'm11',
    categories: ['c2'],
    title: 'Ghee',
    image:
        'https://images.unsplash.com/photo-1578662015962-061ceccfa79c?w=300&h=300&fit=crop',
    description:
        'Pure clarified butter with rich, nutty flavor and golden color. This traditional cooking fat is made by slowly heating butter to remove water and milk solids, resulting in a pure, shelf-stable product. High smoke point makes it perfect for sautéing and frying. Rich in fat-soluble vitamins and adds incredible flavor to Indian and Middle Eastern dishes.',
    price: 8.00,
    rating: 4.8,
  ),

  // Fresh Fruits and Vegetables
  Meal(
    id: 'm12',
    categories: ['c3'],
    title: 'Tomatoes',
    image:
        'https://images.unsplash.com/photo-1546470427-227a5daf6d76?w=300&h=300&fit=crop',
    description:
        'Fresh and juicy red tomatoes perfect for sauces, salads, and cooking. These vine-ripened tomatoes are packed with lycopene, vitamin C, and antioxidants. Ideal for making fresh tomato sauce, salsa, soups, and stews. Great for slicing on sandwiches or adding to salads. Locally sourced and picked at peak ripeness for maximum flavor and nutrition.',
    price: 3.20,
    rating: 4.5,
  ),
  Meal(
    id: 'm13',
    categories: ['c3'],
    title: 'Onions',
    image:
        'https://images.unsplash.com/photo-1518977676601-b53f82aba655?w=300&h=300&fit=crop',
    description:
        'Fresh, flavorful onions that form the base of countless dishes worldwide. These premium onions have layers of sweet and pungent flavors that develop beautifully when cooked. Essential for soups, stews, curries, and stir-fries. Rich in antioxidants and natural compounds that boost immunity. Perfect for caramelizing, sautéing, or using raw in salads and sandwiches.',
    price: 2.50,
    rating: 4.4,
  ),
  Meal(
    id: 'm14',
    categories: ['c3'],
    title: 'Bananas',
    image:
        'https://images.unsplash.com/photo-1603833665858-e61d17a86224?w=300&h=300&fit=crop',
    description:
        'Naturally sweet and nutritious ripe bananas perfect for snacking and baking. These tropical fruits are rich in potassium, vitamin B6, and natural sugars for instant energy. Perfect for smoothies, banana bread, pancakes, or eating fresh. Great for athletes and anyone needing quick, healthy energy. Helps with muscle function and heart health.',
    price: 2.99,
    rating: 4.7,
  ),
  Meal(
    id: 'm15',
    categories: ['c3'],
    title: 'Oranges',
    image:
        'https://images.unsplash.com/photo-1547514701-42782101795e?w=300&h=300&fit=crop',
    description:
        'Juicy and vitamin-rich oranges bursting with natural citrus flavor. These premium oranges are packed with vitamin C, fiber, and antioxidants that boost immune system and overall health. Perfect for fresh juice, fruit salads, or eating as a healthy snack. Sweet and tangy flavor that both kids and adults love. Excellent source of natural energy and hydration.',
    price: 3.10,
    rating: 4.6,
  ),
  Meal(
    id: 'm16',
    categories: ['c3'],
    title: 'Spinach',
    image:
        'https://images.unsplash.com/photo-1576045057995-568f588f82fb?w=300&h=300&fit=crop',
    description:
        'Fresh leafy greens rich in iron, fiber, and essential nutrients. This nutrient-dense vegetable is perfect for salads, smoothies, soups, and sautéed dishes. Packed with vitamins A, C, and K, plus folate and antioxidants. Supports eye health, bone strength, and overall wellness. Great for adding nutrition to pasta dishes, omelets, and green smoothies.',
    price: 2.70,
    rating: 4.4,
  ),

  // Bakery and Snacks
  Meal(
    id: 'm17',
    categories: ['c4'],
    title: 'Bread',
    image:
        'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=300&h=300&fit=crop',
    description:
        'Soft and fluffy white bread perfect for breakfast, sandwiches, and toast. This freshly baked bread has a tender crumb and golden crust, made with quality flour and traditional baking methods. Great for making sandwiches, French toast, or enjoying with butter and jam. Stays fresh for days and freezes well for longer storage.',
    price: 2.50,
    rating: 4.3,
  ),
  Meal(
    id: 'm18',
    categories: ['c4'],
    title: 'Croissant',
    image:
        'https://images.unsplash.com/photo-1555507036-ab794f4afe53?w=300&h=300&fit=crop',
    description:
        'Buttery and flaky French pastry with layers of delicate, crispy texture. This authentic croissant is made with premium butter and traditional lamination techniques, creating hundreds of light, airy layers. Perfect for breakfast with coffee, or filled with chocolate, ham, or cheese. Golden-brown exterior with soft, buttery interior that melts in your mouth.',
    price: 2.20,
    rating: 4.6,
  ),
  Meal(
    id: 'm19',
    categories: ['c4'],
    title: 'Meat Pie',
    image:
        'https://images.unsplash.com/photo-1595777457583-95e059d581b8?w=300&h=300&fit=crop',
    description:
        'Savory pastry filled with seasoned minced meat, potatoes, and aromatic spices. This hearty snack features a golden, flaky crust surrounding a rich filling of beef, onions, and traditional seasonings. Perfect for lunch, dinner, or as a satisfying snack. Baked fresh daily and served warm for maximum flavor and comfort.',
    price: 3.50,
    rating: 4.3,
  ),
  Meal(
    id: 'm20',
    categories: ['c4'],
    title: 'Doughnut',
    image:
        'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=300&h=300&fit=crop',
    description:
        'Sweet fried dough ring topped with sugar glaze or powdered sugar. This classic treat is made with soft, yeasted dough that\'s fried to golden perfection and finished with your choice of toppings. Light, fluffy texture with a sweet coating that makes it irresistible. Perfect with coffee, tea, or as a delightful dessert or snack.',
    price: 2.00,
    rating: 4.2,
  ),
  Meal(
    id: 'm21',
    categories: ['c4'],
    title: 'Chin Chin',
    image:
        'https://images.unsplash.com/photo-1576618148400-f54bed99fcfd?w=300&h=300&fit=crop',
    description:
        'Crunchy and tasty fried snack popular in West African cuisine. These small, cube-shaped treats are made from flour, sugar, and spices, then deep-fried until golden and crispy. Perfect for parties, celebrations, or as a crunchy snack any time of day. Sweet, satisfying crunch with hints of nutmeg and other traditional spices.',
    price: 1.80,
    rating: 4.4,
  ),

  // Dairy and Eggs
  Meal(
    id: 'm22',
    categories: ['c5'],
    title: 'Milk',
    image:
        'https://images.unsplash.com/photo-1550583724-b2692b85b150?w=300&h=300&fit=crop',
    description:
        'Fresh whole milk packed with essential nutrients including calcium, protein, and vitamins. This creamy, rich milk is perfect for drinking, cereal, coffee, tea, or baking. Sourced from local dairy farms and pasteurized for safety while maintaining natural flavor and nutritional value. Great for growing children and adults who need calcium for strong bones.',
    price: 2.30,
    rating: 4.6,
  ),
  Meal(
    id: 'm23',
    categories: ['c5'],
    title: 'Cheese',
    image:
        'https://images.unsplash.com/photo-1486297678162-eb2a19b0a32d?w=300&h=300&fit=crop',
    description:
        'Creamy, aged cheese with rich flavor perfect for sandwiches, cooking, and snacking. This premium cheese is made from quality milk and aged to develop complex flavors and smooth texture. Great for melting on burgers, adding to pasta dishes, or enjoying with crackers. Rich in protein and calcium for nutritional benefits.',
    price: 3.80,
    rating: 4.5,
  ),
  Meal(
    id: 'm24',
    categories: ['c5'],
    title: 'Butter',
    image:
        'https://images.unsplash.com/photo-1589985270826-4b7bb135bc9d?w=300&h=300&fit=crop',
    description:
        'Soft and spreadable butter made from fresh cream, ideal for cooking, baking, and spreading. This premium butter has a rich, creamy texture and natural flavor that enhances both sweet and savory dishes. Perfect for toast, baking cakes and cookies, sautéing vegetables, or making sauces. Made from high-quality dairy with no artificial additives.',
    price: 2.90,
    rating: 4.4,
  ),
  Meal(
    id: 'm25',
    categories: ['c5'],
    title: 'Yogurt',
    image:
        'https://images.unsplash.com/photo-1571212515416-fbb7dd7cbe8c?w=300&h=300&fit=crop',
    description:
        'Smooth and creamy yogurt made from cultured milk with live probiotics for digestive health. This nutritious dairy product is rich in protein, calcium, and beneficial bacteria that support gut health. Perfect with fruits, granola, or honey, or used in smoothies and cooking. Great for breakfast, snacks, or as a healthy dessert alternative.',
    price: 2.50,
    rating: 4.5,
  ),
  Meal(
    id: 'm26',
    categories: ['c5'],
    title: 'Eggs',
    image:
        'https://images.unsplash.com/photo-1582722872445-44dc5f7e3c8f?w=300&h=300&fit=crop',
    description:
        'Farm-fresh eggs from free-range chickens, perfect for breakfast, baking, and cooking. These high-quality eggs have bright orange yolks and firm whites, indicating superior nutrition and taste. Excellent source of complete protein and essential nutrients. Great for scrambling, frying, boiling, or baking cakes and breads.',
    price: 3.00,
    rating: 4.6,
  ),

  // Meat and Fish
  Meal(
    id: 'm27',
    categories: ['c6'],
    title: 'Chicken',
    image:
        'https://images.unsplash.com/photo-1604503468506-a8da13d82791?w=300&h=300&fit=crop',
    description:
        'Freshly cut chicken meat that\'s tender, juicy, and full of flavor. This premium poultry is sourced from healthy, well-raised chickens and cut fresh daily. Perfect for grilling, roasting, frying, or making soups and stews. High in protein and low in fat, making it an excellent choice for healthy meals. Versatile ingredient for countless recipes.',
    price: 5.50,
    rating: 4.7,
  ),
  Meal(
    id: 'm28',
    categories: ['c6'],
    title: 'Beef',
    image:
        'https://images.unsplash.com/photo-1588168333986-5078d3ae3976?w=300&h=300&fit=crop',
    description:
        'Premium beef cuts that are juicy, tender, and perfect for grilling, roasting, or making hearty stews. This high-quality meat comes from carefully selected cattle and is aged to enhance flavor and tenderness. Rich in protein, iron, and B vitamins. Ideal for steaks, roasts, ground beef, or slow-cooked dishes that require robust flavor.',
    price: 6.20,
    rating: 4.5,
  ),
  Meal(
    id: 'm29',
    categories: ['c6'],
    title: 'Goat Meat',
    image:
        'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=300&h=300&fit=crop',
    description:
        'Rich-flavored goat meat that\'s lean, nutritious, and perfect for traditional African dishes. This premium meat has a distinctive taste that\'s prized in many cuisines, especially for pepper soup, curry, and grilled dishes. Lower in fat than beef but rich in protein and iron. Popular choice for special occasions and traditional celebrations.',
    price: 6.80,
    rating: 4.6,
  ),
  Meal(
    id: 'm30',
    categories: ['c6'],
    title: 'Tilapia Fish',
    image:
        'https://images.unsplash.com/photo-1544943910-4c1dc44aab44?w=300&h=300&fit=crop',
    description:
        'Fresh whole tilapia fish with mild flavor and firm, white flesh perfect for grilling, frying, or baking. This popular freshwater fish is rich in protein and omega-3 fatty acids while being low in mercury. Easy to cook and versatile for many recipes. Great for fish stews, grilled whole fish, or filleted for quick cooking.',
    price: 5.90,
    rating: 4.5,
  ),
  Meal(
    id: 'm31',
    categories: ['c6'],
    title: 'Catfish',
    image:
        'https://images.unsplash.com/photo-1544943910-4c1dc44aab44?w=300&h=300&fit=crop',
    description:
        'Fresh catfish perfect for traditional soups, barbecues, and grilled dishes. This popular freshwater fish has firm, flaky meat with a mild flavor that absorbs spices and seasonings beautifully. Essential for authentic pepper soup, perfect for grilling, and excellent in stews. Rich in protein and healthy fats for nutritious meals.',
    price: 6.00,
    rating: 4.4,
  ),
];


 List<Country> countries = [
    Country(
      name: 'Bangladesh',
      code: '+880',
      flag: 'https://flagcdn.com/w320/bd.png',
    ),
    Country(
      name: 'United States',
      code: '+1',
      flag: 'https://flagcdn.com/w320/us.png',
    ),
    Country(
      name: 'United Kingdom',
      code: '+44',
      flag: 'https://flagcdn.com/w320/gb.png',
    ),
    Country(
      name: 'India',
      code: '+91',
      flag: 'https://flagcdn.com/w320/in.png',
    ),
    Country(
      name: 'Pakistan',
      code: '+92',
      flag: 'https://flagcdn.com/w320/pk.png',
    ),
    Country(
      name: 'Canada',
      code: '+1',
      flag: 'https://flagcdn.com/w320/ca.png',
    ),
    Country(
      name: 'Australia',
      code: '+61',
      flag: 'https://flagcdn.com/w320/au.png',
    ),
    Country(
      name: 'Germany',
      code: '+49',
      flag: 'https://flagcdn.com/w320/de.png',
    ),
    Country(
      name: 'France',
      code: '+33',
      flag: 'https://flagcdn.com/w320/fr.png',
    ),
    Country(
      name: 'Japan',
      code: '+81',
      flag: 'https://flagcdn.com/w320/jp.png',
    ),
    Country(
      name: 'South Korea',
      code: '+82',
      flag: 'https://flagcdn.com/w320/kr.png',
    ),
    Country(
      name: 'China',
      code: '+86',
      flag: 'https://flagcdn.com/w320/cn.png',
    ),
    Country(
      name: 'Brazil',
      code: '+55',
      flag: 'https://flagcdn.com/w320/br.png',
    ),
    Country(
      name: 'Mexico',
      code: '+52',
      flag: 'https://flagcdn.com/w320/mx.png',
    ),
    Country(
      name: 'Russia',
      code: '+7',
      flag: 'https://flagcdn.com/w320/ru.png',
    ),
    Country(
      name: 'Turkey',
      code: '+90',
      flag: 'https://flagcdn.com/w320/tr.png',
    ),
    Country(
      name: 'Saudi Arabia',
      code: '+966',
      flag: 'https://flagcdn.com/w320/sa.png',
    ),
    Country(name: 'UAE', code: '+971', flag: 'https://flagcdn.com/w320/ae.png'),
    Country(
      name: 'Nigeria',
      code: '+234',
      flag: 'https://flagcdn.com/w320/ng.png',
    ),
    Country(
      name: 'South Africa',
      code: '+27',
      flag: 'https://flagcdn.com/w320/za.png',
    ),
  ];