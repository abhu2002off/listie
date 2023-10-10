import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listie_client/listie_client.dart';
import 'package:listie_flutter/src/features/core/components/base_component.dart';
import 'package:listie_flutter/src/features/core/ingredient/provider/ingredient_provider.dart';

class IngredientCard extends BaseComponent {
  const IngredientCard(
      {super.key, required this.ingredient, required this.index});

  final Ingredient ingredient;
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider =
        ref.read(ingredientProvider(ingredient.categoryId).notifier);
    return Card(
      child: ListTile(
        dense: true,
        visualDensity: VisualDensity.compact,
        title: Text(ingredient.name),
        trailing: Checkbox.adaptive(
            value: ingredient.isChecked,
            onChanged: (val) {
              provider.toggleIsChecked(index);
            }),
      ),
    );
  }
}
