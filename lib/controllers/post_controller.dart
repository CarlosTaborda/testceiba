import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testceiba/models/post_model.dart';


import 'package:testceiba/repositories/posts_api_repository.dart';
import 'package:testceiba/repositories/posts_repository.dart';








final postPageControllerProvider = Provider((ref) {
  final PostsRepository postsApi = ref.read(postsApiProv);

  return PostPageController( postsApiRep: postsApi);
});

class PostPageController  {

 
  final PostsRepository postsApiRep;
  List<PostModel> posts = List.empty(growable: true);



  PostPageController({required this.postsApiRep});

  Future<List<PostModel>> getPosts(int id)async{
    posts.clear();
    posts.addAll( await postsApiRep.getByUserId(id));
    return posts;
  }



}