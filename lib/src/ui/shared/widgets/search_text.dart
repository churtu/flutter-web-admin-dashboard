import 'package:admin_dashboard/src/ui/inputs/custom_inputs.dart';
import 'package:flutter/material.dart';

class SearchText extends StatelessWidget {
  const SearchText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: _buildDecoration(),
      child: TextField(
        enableInteractiveSelection: false,
        decoration: CustomInputs.searchTextDecoration(
          hint: 'Buscar...',
          icon: Icons.search_outlined
        ),
      ),
    );
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      color: Colors.grey.withOpacity(.1),
      borderRadius: BorderRadius.circular(10)
    );
  }
}