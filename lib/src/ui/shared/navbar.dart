import 'package:admin_dashboard/src/providers/sidebar_provider.dart';
import 'package:admin_dashboard/src/ui/shared/shared.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: 50,
      decoration: _buildDecoration(),
      child: Row(
        children: [
          if(width <= 700)
          IconButton(
            onPressed: () => SidebarProvider.openMenu(), 
            icon: const Icon(Icons.menu_outlined)
          ),
          const SizedBox(width: 5),
          if(width >= 400)
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 250),
            child: const SearchText(),
          ),
          const Spacer(),
          const NotificationsIndicator(),
          const SizedBox(width: 10),
          const NavbarAvatar(),
          const SizedBox(width: 10),
          
        ],
      ),
    );
  }

  BoxDecoration _buildDecoration() {
    return const BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 5 
        )
      ]
    );
  }
}