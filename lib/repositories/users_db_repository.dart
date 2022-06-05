
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:testceiba/config.dart';
import 'package:testceiba/models/user_model.dart';
import 'package:testceiba/repositories/users_repository.dart';

class UsersDbRepository implements UsersRepository{
  

  Database? _db;
  UsersDbRepository(){
    open();
  }
  

  @override
  Future<void> open() async {
    _db = await openDatabase(
          join(await getDatabasesPath(), Config.DB), 
          version: 1,
          onCreate: (Database db, int version) async {
            await db.execute('''
              CREATE TABLE users(
                id INTEGER PRIMARY KEY,
                name TEXT NOT NULL,
                username TEXT NOT NULL,
                email TEXT NOT NULL,
                phone TEXT NOT NULL,
                website TEXT NOT NULL
              )

            ''');
          });
  }

  @override
  Future<List<int>> saveUsers(List<UserModel> users) async {

    List<int> usersIds = List.empty(growable: true);
    for(var u in users){

      usersIds.add( 
        await _db!.insert(
          "users", 
          u.toRowMap(), 
          conflictAlgorithm: ConflictAlgorithm.replace
        )
      );
    }
    return usersIds;

  }

   @override
  Future<List<UserModel>> getAllUsers() async{
    
    var result =  await _db!.query("users");
    List<UserModel> users =  List.empty(growable: true); 

    for( var r in result ){
      users.add(UserModel.fromJson(r));
    }


    return users;
  }

}


final usersDBProv = Provider<UsersRepository>((ref) {
  return UsersDbRepository();
});


