

import 'package:flutter/material.dart';

class RegisterFormProvider with ChangeNotifier {
  String name     = '';
  String email    = '';
  String password = '';

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void validateForm(){
    if(formKey.currentState!.validate()){
      print('$name -- $email -- $password');
      return;
    }
    print('error');
  }

}