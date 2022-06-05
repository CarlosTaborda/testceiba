import 'package:testceiba/models/post_model.dart';

abstract class PostsRepository{

  Future<List<PostModel>> getByUserId(int userId);
}