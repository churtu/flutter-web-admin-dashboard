

import 'package:flutter/material.dart';

class RegisterFormProvider with ChangeNotifier {
  String name     = '';
  String email    = '';
  String password = '';

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool validateForm() => formKey.currentState!.validate();

}