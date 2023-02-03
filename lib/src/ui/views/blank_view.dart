import 'package:admin_dashboard/src/ui/cards/cards.dart';
import 'package:admin_dashboard/src/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class BlankView extends StatelessWidget {
  const BlankView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        Text('Blank view', style: CustomLabels.h1),
        const SizedBox(height: 10),
        const WhiteCard(
          title: 'Sales Stadistics',
          child: Text('hola mundo')
        )
      ],
    );
  }
}