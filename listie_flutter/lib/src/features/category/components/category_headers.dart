import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listie_client/listie_client.dart';
import 'package:listie_flutter/src/features/category/providers/category_provider.dart';
import 'package:listie_flutter/src/features/core/components/base_component.dart';
import 'package:listie_flutter/src/features/core/ingredient/provider/ingredient_provider.dart';

class CategoryHeader extends BaseComponent {
  const CategoryHeader({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(ingredientProvider(category.id!).notifier);
    return Container(
      color: Colors.black87,
      child: ListTile(
        title: Text(category.name),
        trailing: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () async {
            final String? ingredientName = await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Add Items"),
                    content: TextFormField(
                      controller: provider.newIngredientNameController,
                      autofocus: true,
                      decoration:
                          const InputDecoration(hintText: "Ingredient Name .."),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Cancel")),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pop(provider.newIngredientNameController.text);
                          },
                          child: const Text("Add"))
                    ],
                  );
                });
            provider.newIngredientNameController.clear();
            if (ingredientName != null && ingredientName.isNotEmpty) {
              print(ingredientName);
              provider.create(name: ingredientName);
            }
          },
        ),
      ),
    );
  }
}
