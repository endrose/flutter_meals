import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/mels.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
    // required this.onToogleFavorite,
    required this.availableMeals,
  });

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
// INITIAL ANIMATION
    with
        SingleTickerProviderStateMixin {
  // ANIMATION CONTROLLER
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    //
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );

// STARTING ANIMATION
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // final void Function(Meal meal) onToogleFavorite;
  void _selectCategory(BuildContext context, Category category) {
    final filltered = widget.availableMeals
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MealsScreen(
        title: category.title,
        meals: filltered,
        // onToogleFavorite: onToogleFavorite,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            )
        ],
      ),
      builder: (context, child) =>
          // FINETUNING ANIMATION
          SlideTransition(
        position:
            Tween(begin: const Offset(0, 0.3), end: const Offset(0, 0)).animate(
          CurvedAnimation(
              parent: _animationController, curve: Curves.easeInOut),
        ),
        child: child,
      ),
      // Padding(
      //   padding: EdgeInsets.only(
      //     top: 100 - _animationController.value * 100,
      //   ),
      //   child: child,
      // ),
    );
  }
}
