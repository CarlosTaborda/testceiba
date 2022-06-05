

import 'package:testceiba/models/user_model.dart';

abstract class UsersRepository{

  Future<void> open();

  Future<List<UserModel>> getAllUsers();

  Future<List<int>> saveUsers(List<UserModel> users);
}