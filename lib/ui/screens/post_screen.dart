import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:testceiba/controllers/post_controller.dart';
import 'package:testceiba/models/post_model.dart';
import 'package:testceiba/models/user_model.dart';
import 'package:testceiba/ui/widgets/custom_appbar.dart';
import 'package:testceiba/ui/widgets/post_card.dart';
import 'package:testceiba/ui/widgets/user_card.dart';


class PostScreen extends ConsumerWidget {
  const PostScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final user =  ModalRoute.of(context)!.settings.arguments as UserModel;
   

    return Scaffold(
      appBar: CustomAppbar(title: "Posts"),
      body: SingleChildScrollView(
        
        child: Column(
          children: [
            const SizedBox(height: 20),
            UserCard(user,  showButton:false ),
            const SizedBox(height: 20),
            _listPosts( ref , user)
          ],
        ),
      ),
    );
  }

  Widget _listPosts(ref, user){
    return FutureBuilder(
      future: ref.read(postPageControllerProvider).getPosts(user.id??0),
      builder: (_, AsyncSnapshot<List<PostModel>> data){
        
        if(!data.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Column(children: data.data!.map((p) => PostCard(post:  p)).toList(),);


      }
    );
  }
}