import 'package:flutter/material.dart';
import 'package:testceiba/models/post_model.dart';

class PostCard  extends StatelessWidget {

  final PostModel post;

  const PostCard ({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.article,
                    size: 40,
                    color: Colors.teal[900],
                  )
                ),
                Expanded(
                  flex: 6,
                  child: Text(post.title, style: Theme.of(context).textTheme.titleMedium)
                ),
              
          
              ],
            ),
            Text(post.body)
          ],
        ),
      ),

    );
  }
}