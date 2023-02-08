

import 'package:admin_dashboard/src/api/cafe_api.dart';
import 'package:admin_dashboard/src/models/http/customers_response.dart';
import 'package:admin_dashboard/src/models/usuario.dart';
import 'package:admin_dashboard/src/services/services.dart';
import 'package:flutter/material.dart';

class CustomersProvider with ChangeNotifier{
  List<Usuario> customers = [];
  bool isLoading = true;
  bool isOrderAscending = true;
  int? sortColumnIndex;

  CustomersProvider(){
    getPaginatedUsers();
  }

  void sortColumn<T>( Comparable<T> Function(Usuario customer) getField) {
    customers.sort((a, b) => 
      isOrderAscending ? Comparable.compare( getField(a), getField(b))
                     : Comparable.compare(getField(b), getField(a))
    );
    isOrderAscending = !isOrderAscending;
    notifyListeners();
  }

  void refreshCustomer( Usuario value ){
    
    customers = customers.map((customer) {
      if(customer.uid != value.uid ) return customer;
      return value;
    }).toList();
    
    notifyListeners();
  }


  Future getPaginatedUsers() async {
    try {
      final response = await CafeApi.httpGet('/usuarios?limite=100&desde=0');
      final customersResponse = CustomersResponse.fromMap(response);
      customers = [ ...customersResponse.usuarios ];
      isLoading = false; 
      notifyListeners();
    } catch (e) {
      NotificationsService.showSnackbarError('Error al cargar usuarios');
    }
  }

  Future<Usuario?> getUserById(String uid) async {
    try {
      final response = await CafeApi.httpGet('/usuarios/$uid');
      final customer = Usuario.fromMap(response);
      return customer;
    } catch (e) {
      NotificationsService.showSnackbarError('Error al cargar usuario');
      return null;
    }
  }
}