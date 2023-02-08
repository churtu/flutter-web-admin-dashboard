
import 'package:admin_dashboard/src/models/models.dart';
import 'package:admin_dashboard/src/router/app_router.dart';
import 'package:admin_dashboard/src/services/services.dart';
import 'package:flutter/material.dart';

class CustomersDataSource extends DataTableSource{
  final List<Usuario> customers;
  CustomersDataSource(this.customers);
  @override
  DataRow getRow(int index) {
    final customer = customers[index];
    final noImg = Image.asset('no-image.jpg', width: 35, height: 35);
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(ClipOval(child: noImg)),
        DataCell(Text(customer.nombre)),
        DataCell(Text(customer.correo)),
        DataCell(Text(customer.uid)),
        DataCell(
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () => NavigationService.pushReplacementNamed('dashboard/customers/${customer.uid}'),
          )
        ),
      ]
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => customers.length;

  @override
  int get selectedRowCount => 0;

}