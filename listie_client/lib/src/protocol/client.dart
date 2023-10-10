/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:listie_client/src/protocol/category.dart' as _i3;
import 'package:listie_client/src/protocol/ingredient.dart' as _i4;
import 'package:serverpod_auth_client/module.dart' as _i5;
import 'dart:io' as _i6;
import 'protocol.dart' as _i7;

class _EndpointCategory extends _i1.EndpointRef {
  _EndpointCategory(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'category';

  _i2.Future<List<_i3.Category>> listAll() =>
      caller.callServerEndpoint<List<_i3.Category>>(
        'category',
        'listAll',
        {},
      );
}

class _EndpointExample extends _i1.EndpointRef {
  _EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

class _EndpointIngredient extends _i1.EndpointRef {
  _EndpointIngredient(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'ingredient';

  _i2.Future<List<_i4.Ingredient>> listAll() =>
      caller.callServerEndpoint<List<_i4.Ingredient>>(
        'ingredient',
        'listAll',
        {},
      );

  _i2.Future<List<_i4.Ingredient>> category(int categoryId) =>
      caller.callServerEndpoint<List<_i4.Ingredient>>(
        'ingredient',
        'category',
        {'categoryId': categoryId},
      );

  _i2.Future<bool> create({
    required String name,
    required int categoryId,
    required bool isChecked,
  }) =>
      caller.callServerEndpoint<bool>(
        'ingredient',
        'create',
        {
          'name': name,
          'categoryId': categoryId,
          'isChecked': isChecked,
        },
      );

  _i2.Future<_i4.Ingredient?> toggledIsChecked(int itemId) =>
      caller.callServerEndpoint<_i4.Ingredient?>(
        'ingredient',
        'toggledIsChecked',
        {'itemId': itemId},
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i5.Caller(client);
  }

  late final _i5.Caller auth;
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i6.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i7.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    category = _EndpointCategory(this);
    example = _EndpointExample(this);
    ingredient = _EndpointIngredient(this);
    modules = _Modules(this);
  }

  late final _EndpointCategory category;

  late final _EndpointExample example;

  late final _EndpointIngredient ingredient;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'category': category,
        'example': example,
        'ingredient': ingredient,
      };
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
