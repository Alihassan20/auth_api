import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../core/dio_helper.dart';
import '../../core/storage.dart';

class LoginController {

  bool isLoading = false;
  String? email;
  String? password;
  String? confirm;
  final formKey = GlobalKey<FormState>();

  Future<String?> Login() async {
    if(!formKey.currentState!.validate()) return null;
    formKey.currentState!.save();
    final body = {
      "email": email,
      "password": password,
      "returnSecureToken": true
    };
    try{
      final response = await DioHelper.post('signInWithPassword', data: body);
      if(response.statusCode == 200){
        await AppStorage.cacheUserData(email: email!, apiToken: response.data['idToken'], uid: response.data['localId']);
        return 'ok';
      } else {
        print(response.data['error']['message']);
        return response.data['error']['message'];
      }
    } on DioError catch (e){
      print(e.message);
      return e.message;
    } catch(e){
      return e.toString();
    }
  }

}