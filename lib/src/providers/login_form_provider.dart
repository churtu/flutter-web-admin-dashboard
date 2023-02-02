

import 'package:admin_dashboard/src/providers/auth_provider.dart';
import 'package:flutter/material.dart';

class LoginFormProvider with ChangeNotifier {
  String email = '';
  String password = '';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  bool validateForm(){
    if(formKey.currentState!.validate()){
      return true;
    }
    return false;
  }

}