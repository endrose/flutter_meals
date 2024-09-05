import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
// HANDLING ON FILTER PROVIDER
// import 'package:meals/screens/filters.dart';
import 'package:meals/screens/mels.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:meals/providers/meals_provider.dart';
import 'package:meals/providers/favorite_provider.dart';
import 'package:meals/providers/filters_provider.dart';

// HANDLING ON FILTER PROVIDER
// import '../models/meal.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

// CHANGE StateFullWidget TO PROVIDER ConsumerStatefulWidget
class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});
  final activePageInx = 0;

  @override
// CHANGE State to ConsumerState
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

// CHANGE State to ConsumerState
class _TabsScreenState extends ConsumerState<TabsScreen> {
  // int _selectPageindex = 0;

  // void _selectPage(int index) {
  //   setState(() {
  //     _selectPageindex = index;
  //   });
  // }

  int _selectPageIndex = 0;
  // final List<Meal> _favoriteMeals = []; //CHANGE TO FAVORITE PROVIDER

  Map<Filter, bool> _selectedFilter = kInitialFilters;

  // void _showInfoMessage(String message) {
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     content: Text(message),
  //   ));
  // }

// CHANGE TO FAVORITE PROVIDER
  // void _toggleMealFavoriteStatus(Meal meal) {
  //   final isExisting = _favoriteMeals.contains(meal);

  //   if (isExisting) {
  //     setState(() {
  //       _favoriteMeals.remove(meal);
  //       print(_favoriteMeals
  //           .map(
  //             (e) => e.title,
  //           )
  //           .toList());
  //       _showInfoMessage('Meal is no longer a favorite');
  //     });
  //   } else {
  //     setState(() {
  //       _favoriteMeals.add(meal);
  //       print(_favoriteMeals
  //           .map(
  //             (item) => item.title,
  //           )
  //           .toList());
  //       _showInfoMessage('Marked as a favorite');
  //     });
  //   }
  // }

  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
      print({"preset": index});
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();

    if (identifier == 'filters') {
      // HANDLING PROVIDER
      final result =
          await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(
        builder: (context) => const FiltersScreen(),
      ));
      print({"identifier": identifier, "result": result});

      setState(() {
        _selectedFilter = result ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // SETUP USE MEALS PROVIDER
    // final meals = ref.watch(mealsProvider);
    // NOT USE
    // final activeFilters = ref.watch(filtersProvider);

    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
      // onToogleFavorite: _toggleMealFavoriteStatus,
    );
    var activePageTitle = 'Categories';
    // Widget activePage = const CategoriesScreen();
    // var activePageTitle = 'Categories';

    // if (_selectPageindex == 1) {
    //   activePage = const MealsScreen(meals: []);
    //   activePageTitle = 'Your Favorites';
    // }

    if (_selectPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeals,
        // onToogleFavorite: _toggleMealFavoriteStatus,
      );
      activePageTitle = 'Your Favorites';
      print("preset");
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      // body: activePage,
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        // currentIndex: _selectPageindex,
        // onTap: _selectPage,
        currentIndex: _selectPageIndex,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
