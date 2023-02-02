import 'package:admin_dashboard/src/providers/providers.dart';
import 'package:admin_dashboard/src/services/services.dart';
import 'package:admin_dashboard/src/ui/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/src/router/router.dart';
import 'package:admin_dashboard/src/ui/layouts/layouts.dart';
import 'package:provider/provider.dart';

void main() async {
  AppRouter.configureRoutes();
  await LocalStorage.configurePreferences();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (context) => AuthProvider(),
        )
      ],
      child: const AdminDashboardApp(),
    );
  }
}

class AdminDashboardApp extends StatelessWidget {
  const AdminDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.navigatorKey,
      title: 'Admin Dashboard App',
      initialRoute: AppRouter.initialRoute,
      onGenerateRoute: AppRouter.router.generator,
      builder: (context, child){
        final authProvider = Provider.of<AuthProvider>(context);

        switch (authProvider.authStatus){

          case AuthStatus.checking:
            return const SplashLayout();

          case AuthStatus.authenticated:
            return DashboardLayout(child: child!);

          case AuthStatus.notAuthenticated:
            return AuthLayout(child: child!);
        }
      },
      theme: AppTheme.light,
    );
  }
}