import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  //
  FavoriteMealsNotifier() : super([]);

// RETURN BOOL
  bool toogleMealFavoriteStatus(Meal meal) {
    //

    final mealsIsFavorite = state.contains(meal);

    if (mealsIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      print({"if not match", state});
      return false;
    } else {
      state = [...state, meal];
      print({"else match", state});

      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
