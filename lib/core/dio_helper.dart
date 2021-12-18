import 'package:dio/dio.dart';

class DioHelper {

  static const String _API_KEY = 'AIzaSyADppzuPMJUiMKI9XQw1CQtZCiH6nk4LI0';
  static const String _BASE_URL = 'https://identitytoolkit.googleapis.com/v1/accounts:';

  static final Dio _dio = Dio()..options.validateStatus = (v) => v! < 500;

  static Future<Response<dynamic>> post(String path, {dynamic data}) async
  => await _dio.post(_BASE_URL + path + '?key=' + _API_KEY, data: data);

// static Future<Response<dynamic>> get(String path) async
// => _dio.get(path);

}
