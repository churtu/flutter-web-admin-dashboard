
import 'package:admin_dashboard/src/router/app_router.dart';
import 'package:admin_dashboard/src/services/local_storage.dart';
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

  AuthProvider(){
    isAuthenticated();
  }

  void login(String email, String password){
    _token = 'Gato.Token';
    LocalStorage.token = _token;
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    NavigationService.pushReplacementNamed(AppRouter.dashboardRoute);
  }

  Future<bool>isAuthenticated()async{
    if(LocalStorage.token==null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
    await Future.delayed(const Duration(milliseconds: 2000));
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }
}