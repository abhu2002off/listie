import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listie_flutter/src/features/auth/screen/auth_screen.dart';
import 'package:listie_flutter/src/features/core/components/base_component.dart';
import 'package:listie_flutter/src/features/core/providers/session_provider.dart';
import 'package:listie_flutter/src/features/nav/dashboard_container.dart';

class AppContainer extends BaseComponent {
  const AppContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(sessionProvider).isAuthenticated
        ? DashboardScreen()
        : AuthScreen();
  }
}
