

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:testceiba/config.dart';
import 'package:testceiba/models/user_model.dart';
import 'package:testceiba/repositories/users_repository.dart';

class UsersApiRepository implements UsersRepository{
  

  
  @override
  Future<List<UserModel>> getAllUsers() async{
    
    List<UserModel> users = List.empty(growable: true);


    try {

      var response = await Dio().get("${Config.URLAPI}/users");

      for( var user in response.data ){
        users.add(UserModel.fromJson(user));
      }

    } catch (e) {
      log(e.toString());
    }

    return users;
  }
  


  @override
  Future<List<int>> saveUsers(List<UserModel> users) {

    throw UnimplementedError();
  }
  
  @override
  Future<void> open() {
    
    throw UnimplementedError();
  }
  
}


final usersApiProv = Provider<UsersRepository>((ref) {
  return UsersApiRepository();
});