import 'package:admin_dashboard/src/providers/auth_provider.dart';
import 'package:admin_dashboard/src/ui/cards/cards.dart';
import 'package:admin_dashboard/src/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        Text('Dashboard', style: CustomLabels.h1),
        const SizedBox(height: 10),
        WhiteCard(
          title: authProvider.user!.nombre,
          child: Text(authProvider.user!.correo)
        )
      ],
    );
  }
}