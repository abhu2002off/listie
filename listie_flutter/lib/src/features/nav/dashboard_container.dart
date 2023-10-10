import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listie_flutter/src/features/category/components/category_headers.dart';
import 'package:listie_flutter/src/features/category/providers/category_provider.dart';
import 'package:listie_flutter/src/features/core/components/base_screen.dart';
import 'package:listie_flutter/src/features/core/ingredient/components/ingredient_card.dart';
import 'package:listie_flutter/src/features/core/ingredient/provider/ingredient_provider.dart';

class DashboardScreen extends BaseScreen {
  const DashboardScreen({super.key});

  @override
  FloatingActionButton? floatingActionButton(
      BuildContext context, WidgetRef ref) {
    return FloatingActionButton(onPressed: () {
      ref.read(ingredientProvider(1).notifier).create(name: "GRAPES");
    });
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoryProvider);

    return ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, categoryIndex) {
          final category = categories[categoryIndex];
          final ingredients = ref.watch(ingredientProvider(category.id!));
          return Column(
            children: [
              CategoryHeader(category: category),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: ingredients.length,
                  itemBuilder: (context, ingridentIndex) {
                    final ingredient = ingredients[ingridentIndex];
                    return IngredientCard(
                      ingredient: ingredient,
                      index: ingridentIndex,
                    );
                  })
            ],
          );
        });
    /* return Center(
      child: Column(children: [
        Text("Welcome"),
        TextButton(
            onPressed: () {
              ref.read(sessionProvider.notifier).logoutUser();
            },
            child: Text("Logout"))
      ]),
    );*/
  }
}
