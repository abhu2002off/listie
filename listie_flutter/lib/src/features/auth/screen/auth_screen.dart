import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listie_flutter/src/features/core/components/base_screen.dart';
import 'package:listie_flutter/src/features/core/providers/session_provider.dart';
import 'package:listie_flutter/src/utils/api_client.dart';
import 'package:listie_flutter/src/utils/singletons.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

class AuthScreen extends BaseScreen {
  const AuthScreen({super.key});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(title: Text("Welcome"));
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //   if (user != null) Text("Hello i am logged in ${user.userName}"),
        SignInWithEmailButton(
          caller: singleton<ApiClient>().client.modules.auth,
          onSignedIn: () {
            ref.read(sessionProvider.notifier).updateUser();
          },
        ),
      ],
    ));
  }
}
