import 'package:flutter/material.dart';
import 'package:testceiba/models/user_model.dart';


class UserCard extends StatelessWidget {

  late final UserModel _user;
  late final String _page;
  final bool showButton;



  UserCard(UserModel user, {Key? key, this.showButton=true, String? page } ):super(key: key){
    _user = user;
    _page = page??"";

  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(20),
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(_user.name, textAlign: TextAlign.left,),
            ListTile(
              leading: Icon(Icons.phone, color: Theme.of(context).colorScheme.primary),
              title: Text(_user.phone, style: Theme.of(context).textTheme.bodySmall ),
              dense: true,
            ),
            ListTile(
              leading: Icon(Icons.email, color: Theme.of(context).colorScheme.primary),
              title: Text(_user.email, style: Theme.of(context).textTheme.bodySmall),
              dense: true,
            ),
            if( showButton )
              _buttonShowPosts(context, _user.id??0)
          ],
        ),
      ),
    );
  }


  Row _buttonShowPosts(BuildContext context, int  id){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: ()=>Navigator.pushNamed(
            context, 
            _page,
            arguments: _user
          ), 
          child: const Text("VER PUBLICACIONES")
        )
      ],
    );
  }
}