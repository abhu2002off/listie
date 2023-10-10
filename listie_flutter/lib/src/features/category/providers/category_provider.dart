import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listie_client/listie_client.dart';
import 'package:listie_flutter/src/utils/api_client.dart';
import 'package:listie_flutter/src/utils/singletons.dart';

class CategoryProvider extends StateNotifier<List<Category>> {
  final client = singleton<ApiClient>().client.category;
  final addIngredientNameController = TextEditingController();
  final Ref ref;

  CategoryProvider(this.ref) : super([]) {
    init();
  }

  init() async {
    state = await client.listAll();
  }
}

final categoryProvider =
    StateNotifierProvider<CategoryProvider, List<Category>>(
  (ref) => CategoryProvider(ref),
);
