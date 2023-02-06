import 'package:admin_dashboard/src/data_tables/categories_datasource.dart';
import 'package:admin_dashboard/src/providers/providers.dart';
import 'package:admin_dashboard/src/ui/buttons/buttons.dart';
import 'package:admin_dashboard/src/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/src/ui/modals/category_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  void initState() {
    super.initState();
    final categoriesProvider = Provider.of<CategoriesProvider>(context, listen: false);
    categoriesProvider.getCategories();
    
  }
  @override
  Widget build(BuildContext context) {
    final categoriesProvider = Provider.of<CategoriesProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Categorias view', style: CustomLabels.h1),
          const SizedBox(height: 10),
          PaginatedDataTable(
            columns: const  [
              DataColumn(
                label: Text('ID'),
              ),
              DataColumn(
                label: Text('Categoria')
              ),
              DataColumn(
                label: Text('Creado por')
              ),
              DataColumn(
                label: Text('Acciones')
              ),
            ],
            source: CategoriesDataTableSource(context, categoriesProvider.categories),
            header: const Text('Esta es una lista de todas las categorias disponibles.'),
            actions: [
              CustomIconButton(
                onPressed: () => showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context, 
                    builder: (context) => const CategoryModal(),
                  ),
                text: 'Crear', 
                icon: Icons.add_outlined,
                color: Colors.indigo,
              )
            ],
            rowsPerPage: _rowsPerPage,
            onRowsPerPageChanged: (value) => setState(() {
              _rowsPerPage = value!;
            }),
          )
        ],
      ),
    );
  }
}