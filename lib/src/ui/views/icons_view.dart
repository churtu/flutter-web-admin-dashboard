import 'package:admin_dashboard/src/ui/cards/white_card.dart';
import 'package:admin_dashboard/src/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class IconsView extends StatelessWidget {
  const IconsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Icons', style: CustomLabels.h1),
          const SizedBox(height: 10),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: const [
              WhiteCard(
                title: 'ac_unit_outlined',
                width: 170,
                child: Center(
                  child: Icon(Icons.ac_unit_outlined),
                )
              ),
              WhiteCard(
                title: 'access_alarm',
                width: 170,
                child: Center(
                  child: Icon(Icons.access_alarm),
                )
              ),
              WhiteCard(
                title: 'safety_check_outlined',
                width: 170,
                child: Center(
                  child: Icon(Icons.safety_check_outlined),
                )
              ),
              WhiteCard(
                title: 'h_mobiledata_outlined',
                width: 170,
                child: Center(
                  child: Icon(Icons.h_mobiledata_outlined),
                )
              ),
              WhiteCard(
                title: 'three_g_mobiledata',
                width: 170,
                child: Center(
                  child: Icon(Icons.three_g_mobiledata),
                )
              ),
              WhiteCard(
                title: 'g_translate',
                width: 170,
                child: Center(
                  child: Icon(Icons.g_translate),
                )
              ),
              WhiteCard(
                title: 'face_sharp',
                width: 170,
                child: Center(
                  child: Icon(Icons.face_sharp),
                )
              ),
            ],
          )
        ],
      ),
    );
  }
}