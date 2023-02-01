import 'package:flutter/material.dart';

import 'package:admin_dashboard/src/router/router.dart';
import 'package:admin_dashboard/src/ui/layouts/layouts.dart';

void main(){
  AppRouter.configureRoutes();
  runApp(const AdminDashboardApp());
}

class AdminDashboardApp extends StatelessWidget {
  const AdminDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Dashboard App',
      initialRoute: AppRouter.initialRoute,
      onGenerateRoute: AppRouter.router.generator,
      builder: (context, child) => AuthLayout(child: child!),
      theme: ThemeData.light().copyWith(
        scrollbarTheme: const ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(Colors.grey.withOpacity(.5))
        )
      ),
    );
  }
}