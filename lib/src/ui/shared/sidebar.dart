import 'package:admin_dashboard/src/providers/sidebar_provider.dart';
import 'package:admin_dashboard/src/router/app_router.dart';
import 'package:admin_dashboard/src/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/src/ui/shared/shared.dart';
import 'package:provider/provider.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  void navigateTo(String name) {
    SidebarProvider.closeMenu();
    NavigationService.pushNamed(name);
  }

  @override
  Widget build(BuildContext context) {
    final sidebarProvider = Provider.of<SidebarProvider>(context);
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
              onPressed: () => navigateTo(AppRouter.dashboardRoute)
            ),
          CustomMenuItem(
              text: 'Orders',
              icon: Icons.shopping_cart_outlined,
              onPressed: () {}),
          CustomMenuItem(
              text: 'Analytics',
              icon: Icons.show_chart_outlined,
              onPressed: () {}),
          CustomMenuItem(
              text: 'Categories',
              icon: Icons.layers_outlined,
              onPressed: () {}),
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
              onPressed: () {}),
          const SizedBox(height: 30),
          const TextSeparator(text: 'UI Elements'),
          CustomMenuItem(
              isActive: sidebarProvider.currentPage == AppRouter.iconsRoute,
              text: 'Icons',
              icon: Icons.list_alt_outlined,
              onPressed: () => navigateTo(AppRouter.iconsRoute)
          ),
          CustomMenuItem(
              text: 'Marketing',
              icon: Icons.mark_email_read_outlined,
              onPressed: () {}),
          CustomMenuItem(
              text: 'Campaign',
              icon: Icons.note_add_outlined,
              onPressed: () {}),
          CustomMenuItem(
              isActive: sidebarProvider.currentPage == AppRouter.blankPage,
              text: 'Blank', 
              icon: Icons.post_add_rounded, 
              onPressed: () => navigateTo(AppRouter.blankPage)
            ),
          const SizedBox(height: 50),
          const TextSeparator(text: 'Exit'),
          CustomMenuItem(
              text: 'Logout',
              icon: Icons.exit_to_app_outlined,
              onPressed: () {}),
        ],
      ),
    );
  }

  BoxDecoration _buildDecoration() => const BoxDecoration(
      gradient: LinearGradient(colors: [Color(0xff092044), Color(0xff092043)]),
      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)]);
}
