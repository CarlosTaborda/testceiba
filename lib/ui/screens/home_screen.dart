import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:testceiba/controllers/home_controller.dart';
import 'package:testceiba/models/user_model.dart';
import 'package:testceiba/ui/widgets/custom_appbar.dart';
import 'package:testceiba/ui/widgets/user_card.dart';

class HomeScreen extends ConsumerWidget {
  
  const HomeScreen({Key? key}) : super(key: key);


  

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    
    var prov = ref.watch(homePageControllerProvider);
    prov.getUsers();
    var users = prov.users;

    return Scaffold(
      appBar: CustomAppbar(title: "Usuarios"),
      body:  _UsersList(users: users),
    );
  }

  

}



class _UsersList extends StatelessWidget {

  final List<UserModel> users;

  const _UsersList({
    Key? key,
    required this.users
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const _SearchBox(),
          if(users.isEmpty)
            const Text("List is empty"),
          ...users.map((u) => UserCard(u, page: "/post_screen",)).toList()
        ]
      ),
    );
  }
}


class _SearchBox extends StatelessWidget {
  const _SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Consumer(
      builder: (context, ref, child){
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white
          ),
          padding: const EdgeInsets.all(15),
          margin: const  EdgeInsets.all(20),

          child: TextField(
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              
              labelText: "Nombre de usuarios",
              hintText: "Escribe el nombre",
              hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey[400])
            ),
            onChanged: (value){
              ref.read(homePageControllerProvider).filterString = value;
            },
          ),
        );
      },
    );
  }
} 