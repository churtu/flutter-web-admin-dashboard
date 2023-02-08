
import 'package:admin_dashboard/src/api/cafe_api.dart';
import 'package:admin_dashboard/src/models/usuario.dart';
import 'package:flutter/widgets.dart';

class CustomerFormProvider with ChangeNotifier {
  Usuario? customer;
  late GlobalKey<FormState>formKey;

  bool _isValidForm() => formKey.currentState!.validate();
  
  void copyWith({
    String? rol,
    bool? estado,
    bool? google,
    String? nombre,
    String? correo,
    String? uid,
    String? img,
  }){
    customer = Usuario(
      rol: rol ?? customer!.rol, 
      estado: estado ?? customer!.estado, 
      google: google ?? customer!.google, 
      nombre: nombre ?? customer!.nombre, 
      correo: correo ?? customer!.correo, 
      uid: uid ?? customer!.uid
    );
    notifyListeners();
  }

  Future<bool> updateUser()async{
    if(!_isValidForm()) return false;
    final data = {
      'nombre': customer!.nombre,
      'correo': customer!.correo
    };
    try {
      await CafeApi.httpPut('/usuarios/${customer!.uid}', data);
      return true;
    } catch (e) {
      return false;
    }
  }
}
