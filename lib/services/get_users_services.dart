import 'package:dio/dio.dart';
import 'package:flutter_api3/models/users.dart';

class UserService {
  String url = 'https://dummyjson.com/users';

  Future<Users?> getAllData() async {
    var res = await Dio().get(url);
    if (res.statusCode == 200) {
      return Users.fromJson(res.data);
    }

    return Users.fromJson({});
  }

  Future<List<User>?> getUsers() async {
    var res = await Dio().get(url);
    if (res.statusCode == 200) {
      return Users.fromJson(res.data).users!;
      // return res.data['users'].map((e) => User.fromJson(e)).toList();
    }

    return [];
  }

  Future<User?> getUserById(int id) async {
    var res = await Dio().get('$url/$id');
    if (res.statusCode == 200) {
      return User.fromJson(res.data);
    }
    return User.fromJson({});
  }
}
