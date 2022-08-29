import 'dart:io';

import 'package:ejemplo_mvm/users_list/repo/api_status.dart';
import 'package:ejemplo_mvm/utils/contants.dart';
import 'package:http/http.dart' as http;

import '../models/user_list_model.dart';

class UserServices {
  static Future <Object> getUsers() async {
    try{
      Uri url = Uri.parse(usersList);
      final response = await http.get(url);
      if(success==response.statusCode){
        return Success(code: success, response: userListModelFromJson(response.body));
      }
      return Failure(code: userInvalidResponse, response: 'Invalid Response');
    } on HttpException{
      return Failure(code: noInternet, response: 'No Internet Connection');
    } on SocketException{
      return Failure(code: noInternet, response: 'No Internet Connection');
    } on FormatException{
      return Failure(code: invalidFormat, response: 'Invalid Format');
    } catch(e){
      return Failure(code: unknownError, response: 'Unknown Error');
    }
  }
}