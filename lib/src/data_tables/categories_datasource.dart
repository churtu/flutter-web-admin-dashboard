
import 'package:admin_dashboard/src/models/models.dart';
import 'package:admin_dashboard/src/providers/providers.dart';
import 'package:admin_dashboard/src/services/notifications_service.dart';
import 'package:admin_dashboard/src/ui/modals/category_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesDataTableSource extends DataTableSource{
  final BuildContext context;
  final List<Categoria>categorias;

  CategoriesDataTableSource(this.context, this.categorias);
  @override
  DataRow getRow(int index) {
    final category = categorias[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(category.id)),
        DataCell(Text(category.nombre)),
        DataCell(Text(category.usuario.nombre)),
        DataCell(
          Row(
          children: [
            IconButton(
              onPressed: () => showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context, 
                    builder: (context) => CategoryModal(categoria: category),
                  ), 
              icon: const Icon(Icons.edit_outlined)
            ),
            IconButton(
              onPressed: () {
                final alertDialog = AlertDialog(
                  title: const Text('Está seguro de borrarlo?'),
                  content: Text('¿Borrar definitivamente ${category.nombre}'),
                 actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    }, 
                    child: const Text('No')
                  ),
                  TextButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      final categoriesProvider = Provider.of<CategoriesProvider>(context, listen: false);
                      await categoriesProvider.delete(category.id);
                      NotificationsService.showSnackbarSuccess('Categoria ${category.nombre} borrada');
                    }, 
                    child: const Text('Si, borrar')
                  ),
                 ], 
                );
                showDialog(context: context, builder: (context) => alertDialog);
              },
              icon: Icon(Icons.delete_outline, color: Colors.red.withOpacity(.5))
            ),
          ],
        )),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => categorias.length;

  @override
  int get selectedRowCount => 0;

}