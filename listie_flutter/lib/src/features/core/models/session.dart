// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
// ignore: depend_on_referenced_packages
import "package:serverpod_auth_client/module.dart";

part 'session.freezed.dart';

@freezed
class Session with _$Session {
  const Session._();

  factory Session({
    UserInfo? user,
  }) = _Session;

  bool get isAuthenticated {
    return user != null;
  }
}
