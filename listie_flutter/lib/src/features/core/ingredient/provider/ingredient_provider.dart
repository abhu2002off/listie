import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listie_client/listie_client.dart';
import 'package:listie_flutter/src/utils/api_client.dart';
import 'package:listie_flutter/src/utils/singletons.dart';

class IngredientProvider extends StateNotifier<List<Ingredient>> {
  final client = singleton<ApiClient>().client.ingredient;
  final int categoryId;
  final Ref ref;
  final newIngredientNameController = TextEditingController();
  IngredientProvider(this.ref, this.categoryId) : super([]) {
    load();
  }

  load() async {
    state = await client.category(categoryId);
  }

  create({
    required String name,
    bool isChecked = false,
  }) async {
    await client.create(
        name: name, categoryId: categoryId, isChecked: isChecked);
    load();
  }

  toggleIsChecked(int index) async {
    final ingredient = state[index];
    final updatedIngredient = await client.toggledIsChecked(ingredient.id!);
    if (updatedIngredient != null) {
      state = [...state]
        ..removeAt(index)
        ..insert(index, updatedIngredient);
    }
  }
}

final ingredientProvider =
    StateNotifierProvider.family<IngredientProvider, List<Ingredient>, int>(
  (ref, categoryId) => IngredientProvider(ref, categoryId),
);
