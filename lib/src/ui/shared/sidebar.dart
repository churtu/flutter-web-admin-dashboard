
import 'package:admin_dashboard/src/providers/providers.dart';
import 'package:admin_dashboard/src/router/app_router.dart';
import 'package:admin_dashboard/src/services/services.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/src/ui/shared/shared.dart';
import 'package:provider/provider.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  void navigateTo(String name) {
    SidebarProvider.closeMenu();
    NavigationService.pushReplacementNamed(name);
  }

  @override
  Widget build(BuildContext context) {
    final sidebarProvider = Provider.of<SidebarProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    return Container(
      width: 200,
      height: double.infinity,
      decoration: _buildDecoration(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const Logo(),
          const SizedBox(height: 50),
          const TextSeparator(text: 'Main'),
          CustomMenuItem(
              isActive: sidebarProvider.currentPage == AppRouter.dashboardRoute,
              text: 'Dashboard',
              icon: Icons.compass_calibration_outlined,
              onPressed: () => navigateTo(AppRouter.dashboardRoute)),
          CustomMenuItem(
              text: 'Orders',
              icon: Icons.shopping_cart_outlined,
              onPressed: () => navigateTo(AppRouter.ordersRoute),
              isActive: sidebarProvider.currentPage == AppRouter.ordersRoute,
              ),
          CustomMenuItem(
              text: 'Analytics',
              icon: Icons.show_chart_outlined,
              onPressed: () => navigateTo(AppRouter.analyticsRoute),
              isActive: sidebarProvider.currentPage == AppRouter.analyticsRoute),
          CustomMenuItem(
              isActive: sidebarProvider.currentPage == AppRouter.categoriesRoute,
              text: 'Categories',
              icon: Icons.layers_outlined,
              onPressed: () => navigateTo(AppRouter.categoriesRoute)),
          CustomMenuItem(
              text: 'Products',
              icon: Icons.dashboard_outlined,
              onPressed: () {}),
          CustomMenuItem(
              text: 'Discounts',
              icon: Icons.attach_money_outlined,
              onPressed: () {}),
          CustomMenuItem(
              text: 'Customers',
              icon: Icons.people_alt_outlined,
              isActive: sidebarProvider.currentPage == AppRouter.customersRoute,
              onPressed: () => navigateTo(AppRouter.customersRoute),
            ),
          const SizedBox(height: 30),
          const TextSeparator(text: 'UI Elements'),
          CustomMenuItem(
              isActive: sidebarProvider.currentPage == AppRouter.iconsRoute,
              text: 'Icons',
              icon: Icons.list_alt_outlined,
              onPressed: () => navigateTo(AppRouter.iconsRoute)),
          CustomMenuItem(
              text: 'Marketing',
              icon: Icons.mark_email_read_outlined,
              onPressed: () {}),
          CustomMenuItem(
              isActive: sidebarProvider.currentPage == AppRouter.campaignRoute,
              text: 'Campaign',
              icon: Icons.note_add_outlined,
              onPressed: () => navigateTo(AppRouter.campaignRoute)),
          CustomMenuItem(
              isActive: sidebarProvider.currentPage == AppRouter.blankRoute,
              text: 'Blank',
              icon: Icons.post_add_rounded,
              onPressed: () => navigateTo(AppRouter.blankRoute)),
          const SizedBox(height: 50),
          const TextSeparator(text: 'Exit'),
          CustomMenuItem(
              text: 'Logout',
              icon: Icons.exit_to_app_outlined,
              onPressed: () => authProvider.logout()),
        ],
      ),
    );
  }

  BoxDecoration _buildDecoration() => const BoxDecoration(
      gradient: LinearGradient(colors: [Color(0xff092044), Color(0xff092043)]),
      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)]);
}
