import 'package:flutter/material.dart';

import '../users_list/models/user_list_model.dart';
import 'app_title.dart';

class UserListRow extends StatelessWidget {
  final UserModel userModel;
  final void Function()? onTap;
  const UserListRow({super.key, required this.userModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(text: userModel.name!,),
            Text(userModel.email!,style: const TextStyle(color: Colors.black),),
          ],
        ),
      ),
    );
  }
}