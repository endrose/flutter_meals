import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';

// enum Filter {
//   glutenFree,
//   lactoseFree,
//   vegetarian,
//   vegan,
// }

// CHANGE TO Stateless to ConsumerStateFulWidget
class FiltersScreen extends ConsumerWidget {
  //HANDLING FROM FILTER PROVIDER
  // const FiltersScreen({super.key, required this.currentFilters});

  const FiltersScreen({super.key});
  //HANDLING FROM FILTER PROVIDER
  // final Map<Filter, bool> currentFilters;

// TAKE OUT
  // @override
  // ConsumerState<FiltersScreen> createState() {
  //   return _FiltersScreenState();
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.of(context).pop();

      //     if (identifier == 'meals') {
      //       Navigator.of(context).push(MaterialPageRoute(
      //         builder: (context) => const TabsScreen(),
      //       ));
      //     }
      //   },
      // ),
      body: Column(
        children: [
          //
          SwitchListTile(
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (isCheck) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isCheck);

              // setState(() {
              //   _glutenFreeFilterSet = isCheck;
              //   print("check changed + $isCheck");
              // });
            },
            title: Text(
              'Gluten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            subtitle: Text(
              'Only include Gluten-free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (isCheck) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, isCheck);

              // setState(() {
              //   _glutenFreeFilterSet = isCheck;
              //   print("check changed + $isCheck");
              // });
            },
            title: Text(
              'Lactose-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            subtitle: Text(
              'Only include Lactose-free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (isCheck) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, isCheck);

              // setState(() {
              //   _glutenFreeFilterSet = isCheck;
              //   print("check changed + $isCheck");
              // });
            },
            title: Text(
              'Vegatarian',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            subtitle: Text(
              'Only include Vegatarian meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegan]!,
            onChanged: (isCheck) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, isCheck);

              // setState(() {
              //   _glutenFreeFilterSet = isCheck;
              //   print("check changed + $isCheck");
              // });
            },
            title: Text(
              'Vegan',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            subtitle: Text(
              'Only include Vegan meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}

// class _FiltersScreenState extends ConsumerState<FiltersScreen> {
//   // TAKE OUT
//   // var _glutenFreeFilterSet = false;
//   // var _lactoseFreeFilterSet = false;
//   // var _vegetarianFilterSet = false;
//   // var _veganFilterSet = false;

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   setState(() {
//   //     //activeFilters PROVIDER
//   //     final activeFilters = ref.read(filtersProvider);
//   //     _glutenFreeFilterSet = activeFilters[Filter.glutenFree]!;
//   //     _lactoseFreeFilterSet = activeFilters[Filter.lactoseFree]!;
//   //     _vegetarianFilterSet = activeFilters[Filter.vegetarian]!;

//   //     _veganFilterSet = activeFilters[Filter.vegan]!;
//   //   });
//   // }

  
// }
