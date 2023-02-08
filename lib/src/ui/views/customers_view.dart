import 'package:admin_dashboard/src/data_tables/data_tables.dart';
import 'package:admin_dashboard/src/providers/customers_provider.dart';
import 'package:admin_dashboard/src/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomersView extends StatelessWidget {
  const CustomersView({super.key});

  @override
  Widget build(BuildContext context) {
  final customersProvider = Provider.of<CustomersProvider>(context); 
  final customersDataSource = CustomersDataSource(customersProvider.customers);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Customers view', style: CustomLabels.h1),
          const SizedBox(height: 10),
          PaginatedDataTable(
            sortAscending: customersProvider.isOrderAscending,
            sortColumnIndex: customersProvider.sortColumnIndex,
            columns: [
              const DataColumn(label: Text('Avatar')),
              DataColumn(
                label: const Text('Nombre'),
                onSort: (columnIndex, ascending) {
                  customersProvider.sortColumnIndex = columnIndex;
                  customersProvider.sortColumn<String>((customer) => customer.nombre);
                },
              ),
              DataColumn(
                label: const Text('Email'),
                onSort: (columnIndex, ascending) {
                  customersProvider.sortColumnIndex = columnIndex;
                  customersProvider.sortColumn<String>((customer) => customer.correo);
                }
              ),
              const DataColumn(label: Text('UID')),
              const DataColumn(label: Text('Acciones')),
            ], 
            source: customersDataSource,
            onPageChanged: (value) => print(value),
          )
        ],
      ),
    );
  }
}