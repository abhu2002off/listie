import 'package:listie_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class IngredientEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<List<Ingredient>> listAll(Session session) async {
    final userId = await session.auth.authenticatedUserId;

    if (userId == null) {
      return [];
    }

    return await Ingredient.find(
      session,
      where: (item) => item.userId.equals(userId),
    );
  }

  Future<List<Ingredient>> category(Session session, int categoryId) async {
    final userId = await session.auth.authenticatedUserId;

    if (userId == null) {
      return [];
    }

    return await Ingredient.find(
      session,
      where: (item) =>
          item.userId.equals(userId) & item.categoryId.equals(categoryId),
    );
  }

  Future<bool> create(Session session,
      {required String name,
      required int categoryId,
      bool isChecked = false}) async {
    final userId = await session.auth.authenticatedUserId;
    if (userId == null) {
      return false;
    }

    final ingredient = Ingredient(
        userId: userId,
        name: name,
        categoryId: categoryId,
        isChecked: isChecked);
    await Ingredient.insert(session, ingredient);
    return true;
  }

  Future<Ingredient?> toggledIsChecked(Session session, int itemId) async {
    final userId = await session.auth.authenticatedUserId;
    final ingredient = await Ingredient.findSingleRow(session,
        where: (item) => item.id.equals(itemId) & item.userId.equals(userId));

    if (ingredient != null) {
      ingredient.isChecked = !ingredient.isChecked;
      Ingredient.update(session, ingredient);
      return ingredient;
    }

    return null;
  }
}
