import 'package:admin_dashboard/src/models/models.dart';
import 'package:admin_dashboard/src/providers/providers.dart';
import 'package:admin_dashboard/src/services/services.dart';
import 'package:admin_dashboard/src/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/src/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/src/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryModal extends StatefulWidget {
  final Categoria? categoria;
  const CategoryModal({
    super.key, 
    this.categoria
  });

  @override
  State<CategoryModal> createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryModal> {
  String nombreCategoria = '';
  String? id;

  @override
  void initState() {
    super.initState();
    id = widget.categoria?.id;
    nombreCategoria = widget.categoria?.nombre ?? '';
  }
  @override
  Widget build(BuildContext context) {
    final categoriesProvider = Provider.of<CategoriesProvider>(context, listen: false);
    return Container(
      padding: const EdgeInsets.all(20),
      width: 300,
      height: 500,
      decoration: _buildDecoration(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.categoria?.nombre ?? 'Nueva categoria',
                style: CustomLabels.h1.copyWith(
                  color: Colors.white
                ),
              ),
              IconButton(
                  icon: const Icon(Icons.close, color: Colors.white,),
                  onPressed: () => Navigator.pop(context),
                )
            ],
          ),
          Divider(color: Colors.white.withOpacity(.3)),
          const SizedBox(height: 20),
          TextFormField(
            initialValue: widget.categoria?.nombre ?? '',
            onChanged: (value) => nombreCategoria = value,
            decoration: CustomInputs.authInputDecoration(
              hint: 'Nombre de la categoría', 
              label: 'Categoría', 
              icon: Icons.new_releases_outlined
            ),
            style: const TextStyle(color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: CustomOutlinedButton(
              onPressed: () async {
                Navigator.pop(context);  
                if(id == null){
                  await categoriesProvider.create(nombreCategoria);
                  NotificationsService.showSnackbarSuccess('Categoria $nombreCategoria creada.');
                  return;
                }
                await categoriesProvider.update(id!, nombreCategoria);
                NotificationsService.showSnackbarSuccess('Categoria $nombreCategoria modificada.');
              },
              text: 'Guardar',
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration _buildDecoration() => const BoxDecoration(
    color: Color(0xff0f2041), 
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20)
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black26
      )
    ]
  );
}