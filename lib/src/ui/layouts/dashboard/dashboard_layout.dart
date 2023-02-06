
import 'package:admin_dashboard/src/providers/sidebar_provider.dart';
import 'package:admin_dashboard/src/ui/shared/shared.dart';
import 'package:flutter/material.dart';

class DashboardLayout extends StatefulWidget {
  final Widget child;
  const DashboardLayout({Key? key, required this.child}) : super(key: key);

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> with SingleTickerProviderStateMixin{
  @override
  void initState() {
    super.initState();
    SidebarProvider.sidebarController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300)
    );
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xffedf1f2),
      body: Stack(
        children: [
          Row(
            children: [
              if(width > 700)
              const Sidebar(),
              Expanded(
                child: Column(
                  children: [
                    const Navbar(),
                    Expanded(
                      child: Container(
                        child: widget.child)
                    )
                  ],
                ),
              )
            ],
          ),
          if(width <= 700)
            AnimatedBuilder(
              animation: SidebarProvider.sidebarController,
              builder: (context, child) {
                return Stack(
                  children: [
                    if(SidebarProvider.isMenuOpen)
                    Opacity(
                      opacity: SidebarProvider.opacity.value,
                      child: GestureDetector(
                      onTap: () => SidebarProvider.closeMenu(),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.black38,
                        ),
                      ),
                    ),
                    ),
                    Transform.translate(
                      offset: Offset(SidebarProvider.movement.value, 0),
                      child: const Sidebar())
                  ],
                );
              },
            )
        ],
      ),
    );
  }
}