import 'package:ejemplo_mvm/components/app_error.dart';
import 'package:ejemplo_mvm/components/app_loading.dart';
import 'package:ejemplo_mvm/components/app_title.dart';
import 'package:ejemplo_mvm/components/user_list_row.dart';
import 'package:ejemplo_mvm/users_list/models/user_list_model.dart';
import 'package:ejemplo_mvm/users_list/views_models/users_view_model.dart';
import 'package:ejemplo_mvm/utils/navigation_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Users'),
        actions: [
          IconButton(
            onPressed: () async {openAddUser(context);}, 
            icon: const Icon(Icons.add)
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _ui(usersViewModel)
          ],
        ),
      ),
    );
  }

  _ui(UsersViewModel usersViewModel){
    if(usersViewModel.loading){
      return AppLoading();
    }
    if(usersViewModel.userError!=null){
      return AppError(
        errortxt: usersViewModel.userError!.message.toString(),
      );
    }
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context,index){
          UserModel userModel = usersViewModel.userListModel[index];
          return  UserListRow(
            userModel: userModel,
            onTap: () async {
              usersViewModel.setSelectedUser(userModel);
              openUserDetails(context);
            },
          );
        }, 
        separatorBuilder: (context, index) => const Divider(), 
        itemCount: usersViewModel.userListModel.length
      ),
    );
  }
}