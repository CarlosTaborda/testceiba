import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:testceiba/config.dart';
import 'package:testceiba/models/post_model.dart';
import 'package:testceiba/repositories/posts_repository.dart';

class PostsApiRepository implements PostsRepository{
  
  
  @override
  Future<List<PostModel>> getByUserId(int userId) async {

    List<PostModel> posts = List.empty(growable:  true);
    
    try {

      var response = await Dio().get("${Config.URLAPI}/posts", queryParameters: {"userId":userId});

      for( var post in response.data ){
        posts.add(PostModel.fromJson(post));
      }

    } catch (e) {
      log(e.toString());
    }

    return posts;

  }
  
}

final postsApiProv = Provider((ref) {
  return PostsApiRepository();
});