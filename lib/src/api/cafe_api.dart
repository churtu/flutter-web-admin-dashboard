
import 'package:admin_dashboard/src/services/services.dart';
import 'package:dio/dio.dart';

class CafeApi {
  static final Dio _dio = Dio();
  
  static void configureDio(){
    _dio.options.baseUrl = 'http://localhost:8080/api';

    _dio.options.headers = {
      'x-token': LocalStorage.token
    };
  }

  static Future httpGet(String path) async {
    try {
      final response = await _dio.get(path);
      return response.data;
    } catch (e) {
      throw 'Error: $e';
    }
  }

  static Future httpPost(String path, Map<String, dynamic>data) async {
    try {
      final formData = FormData.fromMap(data);
      final response = await _dio.post(path, data: formData);
      return response.data;
    } catch (e) {
      throw 'Error: $e';
    }
  }

}