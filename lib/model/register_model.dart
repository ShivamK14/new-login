import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class RegisterResponseModel{
  final String token;
  final String error;
  RegisterResponseModel({
    this.token, this.error
  });
  factory RegisterResponseModel.fromJson(Map<String, dynamic> json){
    return RegisterResponseModel(token:  json["token"] != null ? json["token"]:"",
      error:json["error"] != null ? json["error"] : "",);
  }

}


class RegisterRequestModel {
  String username;
  String password;
  String mobile;
  String email;

  RegisterRequestModel({
    @required this.username,
    @required this.password,
    @required this.mobile,
    @required this.email,
  });


  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    return RegisterRequestModel(
        username: json['username'],
        password: json['password'],
        mobile: json['mobile'],
        email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'username': username.trim(),
      'password': password.trim(),
      'mobile': mobile.trim(),
      'email': email.trim(),
    };
    return map;
  }
}