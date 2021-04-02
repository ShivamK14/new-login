import 'package:app/model/login_model.dart';
import 'package:app/model/register_model.dart';
import 'package:http/http.dart'  as http;
import 'dart:convert';

import '../model/login_model.dart';

class APIService{
  // static Future<bool> login(LoginRequestModel requestModel) async{
  //   //String url ="http://10.0.2.2/api/login";
  //
  //   final response = await http.post(Uri.http("http://10.0.2.2","/api/login"), body:{
  //     'username':requestModel.email,
  //     'password':requestModel.password,
  //   }
  //   );
  //   if(response.statusCode == 200 || response.statusCode == 400){
  //     //return LoginResponseModel.fromJson(json.decode(response.body));
  //     return true;
  //   } else {
  //     throw Exception('Failed to Load data');
  //   }
  //
  //
  // }

  static Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    //String url ="http://10.0.2.2/api/login";

    final response = await http.post(
        Uri.http("127.0.0.1:8000", "api/auth/login"),
        body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 401) {
      return LoginResponseModel.fromJson(json.decode(response.body));
      //return true;
    } else {
      throw Exception('Failed to Load data');
    }
  }
  static Future<RegisterResponseModel> register(RegisterRequestModel requestMode2) async{
    //String url ="http://10.0.2.2/api/login";

    final response = await http.post(Uri.http("127.0.0.1:8000","api/auth/register"),body: requestMode2.toJson());
    if(response.statusCode == 200 || response.statusCode == 400){
      return RegisterResponseModel.fromJson(json.decode(response.body));
      //return true;
    } else {
      throw Exception('Failed to Load data');
    }


  }
}