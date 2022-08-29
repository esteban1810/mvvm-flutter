import 'package:ejemplo_mvm/components/app_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../views_models/users_view_model.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text(usersViewModel.selectedUser!.name!),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(text: usersViewModel.selectedUser!.name!,),
            Text(
              usersViewModel.selectedUser!.email!,
              style: const TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}