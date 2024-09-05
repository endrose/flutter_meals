import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/meal_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// CHANGE STATELESSWIDGET TO CONSUMERWIGET
class MealsScreen extends ConsumerWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    // required this.onToogleFavorite,
  });
  final String? title;

  final List<Meal> meals;
  // final void Function(Meal meal) onToogleFavorite;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDetailsScreen(
          meal: meal,
          // onToggleFavorite: onToogleFavorite,
        ),
      ),
    );
  }

  @override
  // WIDGETREF TO GET PROVIDER
  Widget build(BuildContext context, WidgetRef ref) {
    Widget content = ListView.builder(
      itemBuilder: (context, index) => Text(
        meals[index].title,
        style: const TextStyle(color: Colors.white),
      ),
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Uh oh...nothing here!',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Try selecting a different category',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            )
          ],
        ),
      );
    }

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) => MealItem(
          onSelectMeal: (meal) {
            selectMeal(context, meal);
          },
          meal: meals[index],
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
