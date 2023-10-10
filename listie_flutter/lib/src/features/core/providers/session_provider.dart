import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listie_flutter/src/features/core/models/session.dart';
import 'package:listie_flutter/src/utils/api_client.dart';
import 'package:listie_flutter/src/utils/singletons.dart';

class SessionProvider extends StateNotifier<Session> {
  final Ref ref;
  final sessionManager = singleton<ApiClient>().sessionManager;
  final client = singleton<ApiClient>().client;

  SessionProvider(this.ref, Session initial) : super(initial) {
    init();
  }

  init() {
    updateUser();
  }

  updateUser() {
    final user = sessionManager.signedInUser;
    state = state.copyWith(user: user);
  }

  logoutUser() async {
    await sessionManager.signOut();
    updateUser();
  }
}

final sessionProvider = StateNotifierProvider<SessionProvider, Session>(
    (ref) => SessionProvider(ref, Session()));
