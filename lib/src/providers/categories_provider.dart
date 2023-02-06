
import 'package:admin_dashboard/src/api/cafe_api.dart';
import 'package:admin_dashboard/src/models/models.dart';
import 'package:admin_dashboard/src/services/services.dart';
import 'package:flutter/material.dart';

class CategoriesProvider with ChangeNotifier{
  List<Categoria> categories = [];

  Future getCategories()async{
    final response = await CafeApi.httpGet('/categorias');
    final categoriesResponse = CategoriesResponse.fromMap(response);
    categories = [...categoriesResponse.categorias];
    notifyListeners();
  }

  Future create(String name)async{
    final data = {
      'nombre': name
    };
    try {
      final response = await CafeApi.httpPost('/categorias', data);
      final newCategory = Categoria.fromMap(response);
      categories.add(newCategory);
      notifyListeners();
      
    } catch (e) {
      NotificationsService.showSnackbarError('Error al crear categoria'); 
    }
  }

  Future update(String id, String name)async{
    final data = {
      'nombre': name
    };

    try {
      
      await CafeApi.httpPut('/categorias/$id', data);
      categories = categories.map((categoria) {
        if(categoria.id != id) return categoria;
        categoria.nombre = name;
        return categoria;
      }).toList();
      notifyListeners();
    } catch (e) {
      NotificationsService.showSnackbarError('Error al actualizar categoria'); 
    }
  }

  Future delete(String id)async{
    try {
      await CafeApi.httpDelete('/categorias/$id');
      categories.removeWhere((category) => category.id == id);
      notifyListeners();
    } catch (e) {
      NotificationsService.showSnackbarError('Error al borrar categoría'); 
    }
  }
}