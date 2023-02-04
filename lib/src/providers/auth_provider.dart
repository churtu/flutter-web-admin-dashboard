
import 'package:admin_dashboard/src/api/cafe_api.dart';
import 'package:admin_dashboard/src/models/models.dart';
import 'package:admin_dashboard/src/router/app_router.dart';
import 'package:admin_dashboard/src/services/services.dart';
import 'package:flutter/material.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated
}

class AuthProvider with ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;
  Usuario? user;

  AuthProvider(){
    isAuthenticated();
  }

  Future login(String email, String password) async {

    final data = {
      'correo'  : email,
      'password': password
    };

    try {
      final response = await CafeApi.httpPost('/auth/login', data);
      final authResponse = AuthResponse.fromMap(response);
      user = authResponse.usuario;
      _token = authResponse.token;
      LocalStorage.token = _token;
      CafeApi.configureDio(); // refresca el x-token header
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      NavigationService.pushReplacementNamed(AppRouter.dashboardRoute);
    } catch (e) {
      NotificationsService.showSnackbarError('Credenciales no válidas.');
    }
  }

  Future register(String name, String email, String password)async{

    final data = {
      'nombre'  : name,
      'correo'  : email,
      'password': password
    };
    try {
      final response = await CafeApi.httpPost('/usuarios', data);
      final authResponse = AuthResponse.fromMap(response);
      user = authResponse.usuario;
      _token = authResponse.token;
      LocalStorage.token = _token;  
      CafeApi.configureDio(); // refresca el x-token header
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      NavigationService.pushReplacementNamed(AppRouter.dashboardRoute);
    } catch (e) {
      NotificationsService.showSnackbarError('Credenciales no válidas.');
    }
    
  }

  void logout(){
    LocalStorage.sharedPreferences.remove('token');
    authStatus  = AuthStatus.notAuthenticated;
    _token      = null;
    user        = null;
    notifyListeners();
  }

  Future<bool>isAuthenticated()async{
    if(LocalStorage.token==null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
    try {
      final response = await CafeApi.httpGet('/auth');
      final authResponse = AuthResponse.fromMap(response);
      user = authResponse.usuario;
      authStatus = AuthStatus.authenticated;
      _token = authResponse.token;
      LocalStorage.token = _token;
      CafeApi.configureDio();
      notifyListeners();
      return true;
    } catch (e) {
      authStatus = AuthStatus.notAuthenticated;
      user = null;
      _token = null;
      notifyListeners();
      return false;
    }
  }
}