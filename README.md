### Architecture Choices
- **Riverpod Pattern**: Implemented MVVM-like architecture with Riverpod for robust state management
- **Separation of Concerns**: Clear separation between UI (screens), business logic (providers), and data (models)
- **Mock Data Strategy**: Implemented realistic data structures to simulate real API responses
- **Modular Component Structure**: Reusable widgets and organized screen hierarchy# 🛒 Grocery Delivery App

A feature-rich grocery delivery app built with **Flutter**, showcasing a complete end-to-end flow from onboarding to order completion. The app includes phone number entry, OTP verification, location selection, shopping, checkout, and order management with realistic success/failure simulation.

## 📱 App Demo

> **APK Available**: Ready for installation and testing

---

## ✨ Complete Feature Set

### 🧭 Authentication Flow
- **Multi-screen onboarding** with friendly UI and images
- **Country selector** using bottom sheet modal (with flags and country codes)
- **Mobile number input** with validation
- **Mock OTP verification** screen with proper UI/UX

### 📍 Location & Setup
- **Dynamic location selection**: Zone selection updates available areas
- **Responsive dropdowns** with proper error handling
- **Regional targeting simulation** for delivery areas

### 🏪 Shopping Experience
- **Home Screen**: Grid layout displaying grocery items with mock data
- **Explore Screen**: Search functionality with categorized products
- **Product Details**: Comprehensive product pages with images, descriptions, and pricing
- **Favorites System**: Mark and manage favorite products
- **Shopping Cart**: Add/remove items with quantity management and dynamic total calculation

### 💳 Checkout & Orders
- **Complete Checkout Flow**: Review items, apply discounts, select payment method
- **Order Processing**: Real-time order status updates
- **Success/Failure Simulation**: 70% success rate using mathematical probability
- **Order Success Screen**: Confirmation with order details and tracking info
- **Order Failure Screen**: Error handling with retry options and customer support

### 🎯 User Experience
- **Responsive Design**: Optimized for various screen sizes
- **Image Placeholders**: Consistent fallback images where necessary
- **Smooth Navigation**: Intuitive flow between screens
- **State Management**: Proper handling of app state and user data

---

## 🔧 Technical Implementation

### Technology Stack
| Component | Technology |
|-----------|------------|
| **Framework** | Flutter |
| **Architecture** | MVVM with Riverpod Pattern |
| **State Management** | Riverpod for global state management |
| **Navigation** | Navigator.push with proper routing |
| **Data Storage** | Local mock data with structured models |
| **UI Framework** | Material Design widgets |
| **Image Handling** | Network images with fallback placeholders |

### Key Technical Features
- **Mock Data Integration**: Realistic product data with images and descriptions
- **Mathematical Simulation**: 70% success rate for order processing using random number generation
- **Riverpod State Management**: Efficient global state handling with providers
- **Error Handling**: Comprehensive error states and fallback mechanisms
- **Responsive UI**: Adaptive layouts for different screen sizes
- **Reactive Programming**: Clean separation of UI and business logic

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Android Studio / VS Code
- Android device or emulator

### Installation
1. **Clone the repository**
   ```bash
   git clone https://github.com/olamideid/food_test.git
   cd food_test
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### APK Installation
- Download the provided APK file
- Enable "Unknown Sources" in Android settings
- Install and launch the app

---

## 💡 Technical Decisions & Solutions

### Architecture Choices
- **StatefulWidget Approach**: Chosen for simplicity and direct state management
- **Mock Data Strategy**: Implemented realistic data structures to simulate real API responses
- **Modular Screen Structure**: Each screen is self-contained for better maintainability

### Key Challenges Solved

#### 1. **Dropdown State Management**
- **Challenge**: UI errors when selecting area before zone selection
- **Solution**: Implemented null checks and `ValueKey` for safe dropdown resets
- **Code**: Used conditional rendering to prevent premature dropdown population

#### 2. **Navigation Flow Control**
- **Challenge**: Premature navigation triggering
- **Solution**: Wrapped navigation calls in lambda functions `() =>` for proper event handling
- **Impact**: Smooth user experience without accidental screen transitions

#### 3. **Keyboard Overlap Issues**
- **Challenge**: FAB and layout elements overlapping with keyboard on OTP screen
- **Solution**: Implemented `FocusNode` listeners with `_isKeyboardVisible` state management
- **Result**: Dynamic UI adjustments based on keyboard visibility

#### 4. **Image Loading Reliability**
- **Challenge**: Network images failing to load causing UI breaks
- **Solution**: Added `errorBuilder` fallbacks for all network images
- **Benefit**: Consistent UI experience regardless of network conditions

#### 5. **Order Success/Failure Simulation**
- **Challenge**: Creating realistic order processing experience
- **Solution**: Implemented mathematical probability (70% success rate) using `Random` class
- **Algorithm**: `Random().nextInt(100) < 70` for success determination

---

## ⏱️ Development Timeline

| Feature Development | Time Invested |
|---------------------|---------------|
| **Onboarding & Authentication** | 2.5 hrs |
| **Location Selection Logic** | 1.5 hrs |
| **Product Catalog & Details** | 2 hrs |
| **Shopping Cart Functionality** | 2 hrs |
| **Checkout Flow** | 2 hrs |
| **Order Success/Failure Screens** | 1.5 hrs |
| **UI Polish & Bug Fixes** | 1.5 hrs |
| **Testing & APK Build** | 1 hr |
| **Total Development Time** | **~14 hrs** |

---

## 📁 Project Structure

```
lib/
├── main.dart                          # App entry point
├── data/
│   └── mockdata.dart                 # Static product and user data
├── helpers/
│   └── to_meal.dart                  # Utility functions and converters
├── models/
│   ├── cart.dart                     # Cart data structure
│   ├── category.dart                 # Category model
│   ├── country.dart                  # Country model with flags
│   └── meal.dart                     # Product/meal data structure
├── providers/
│   ├── cart_provider.dart            # Cart state management
│   ├── favorites.dart                # Favorites state management
│   ├── filters.dart                  # Filter state management
│   └── search_provider.dart          # Search functionality
├── screens/
│   ├── cart_screen.dart              # Shopping cart
│   ├── category.dart                 # Category browsing
│   ├── favorites.dart                # Favorite products
│   ├── food_details.dart             # Product detail view
│   ├── food_screen.dart              # Product listing
│   ├── home.dart                     # Home screen
│   ├── login.dart                    # Authentication
│   ├── onboarding.dart               # Welcome screens
│   ├── onboarding1.dart              # Onboarding step 1
│   ├── onboarding2.dart              # Onboarding step 2
│   ├── onboarding3.dart              # Onboarding step 3
│   ├── onboarding4.dart              # Onboarding step 4
│   ├── profile_screen.dart           # User profile
│   ├── see_all.dart                  # View all products
│   ├── signup.dart                   # User registration
│   └── splash.dart                   # Splash screen
├── widgets/
│   ├── home/
│   │   ├── button.dart               # Custom buttons
│   │   ├── meal_card_content.dart    # Product card content
│   │   ├── meal_section.dart         # Product sections
│   │   ├── rating.dart               # Rating component
│   │   └── welcome_section.dart      # Welcome UI
│   ├── auth.dart                     # Authentication widgets
│   ├── category_card.dart            # Category display
│   ├── filter_sheet.dart             # Filter bottom sheet
│   └── meal_card.dart                # Product card component
└── auth.dart                         # Authentication utilities
```

---

## 🔍 Key Learnings & Skills Demonstrated

### Technical Skills
- **Flutter UI Development**: Complex layouts with Material Design
- **State Management**: Efficient handling of app state across screens
- **Navigation Patterns**: Implementing smooth user flows
- **Error Handling**: Comprehensive error states and recovery mechanisms
- **Mock Data Management**: Realistic data simulation techniques

### Problem-Solving Approach
- **Systematic Debugging**: Identified and resolved UI conflicts systematically
- **User Experience Focus**: Prioritized smooth, intuitive user interactions
- **Performance Optimization**: Efficient image loading and state updates
- **Mathematical Implementation**: Applied probability concepts for realistic simulations

### Professional Development
- **Clean Code Practices**: Organized, maintainable code structure
- **Documentation**: Comprehensive README and inline code comments
- **Testing Approach**: Thorough manual testing across different scenarios
- **Delivery Focus**: Production-ready APK with complete feature set

---



## 📞 Contact & Support

For questions, suggestions, or collaboration opportunities:
- **Email**: Iakinola926@gmail.com
- **GitHub**: (https://github.com/Olamideid)
- **LinkedIn**: (https://www.linkedin.com/in/akinola-idowu-99509a321/)

---

*Built with ❤️ using Flutter*