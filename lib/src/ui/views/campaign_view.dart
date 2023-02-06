import 'package:admin_dashboard/src/ui/cards/cards.dart';
import 'package:admin_dashboard/src/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class CampaignView extends StatelessWidget {
  const CampaignView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Campaign view', style: CustomLabels.h1),
          const SizedBox(height: 10),
          const WhiteCard(
            title: 'Campaign',
            child: Text('hola mundo')
          )
        ],
      ),
    );
  }
}