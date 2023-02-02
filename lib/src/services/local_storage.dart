
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences sharedPreferences;
  static Future<void> configurePreferences()async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static String? get token => sharedPreferences.getString('token');
  
  static set token(String? token){
    sharedPreferences.setString('token', token!);
  }
}