import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';


import 'package:testceiba/models/user_model.dart';
import 'package:testceiba/repositories/users_api_repository.dart';
import 'package:testceiba/repositories/users_db_repository.dart';
import 'package:testceiba/repositories/users_repository.dart';






final homePageControllerProvider = ChangeNotifierProvider<HomePageController>((ref) {
  final UsersRepository usersApi = ref.read(usersApiProv);
  final UsersRepository usersDB = ref.read(usersDBProv);

  return HomePageController( usersApiRep: usersApi, usersDBRep: usersDB);
});

class HomePageController  extends ChangeNotifier  {


  final UsersRepository usersApiRep;
  final UsersRepository usersDBRep;
  String _filterString = "";
  final List<UserModel> _users = List.empty(growable: true);

  List<UserModel> get users => _users.where((u) => u.name.toLowerCase().contains(_filterString.toLowerCase())).toList();

  String get filterString =>_filterString;
  set filterString(String string){
    _filterString = string;
    notifyListeners();
  }




  HomePageController({ required this.usersApiRep, required this.usersDBRep});

  Future<void> getUsers() async {

    if(_users.isNotEmpty) {
      return;
    }
          
    _users.clear();

    await usersDBRep.open();

    // load from db
    _users.addAll( await usersDBRep.getAllUsers());

    log(_users.isEmpty? "LOAD USERS FROM API": "LOAD USERS FROM DB");

    if( _users.isEmpty ){

      // load from api
      _users.addAll( await  usersApiRep.getAllUsers() );
      usersDBRep.saveUsers(_users);//save in local db
    }

    notifyListeners();

  }

}