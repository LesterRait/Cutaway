import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cutaway/client/ApiClient.dart';
import 'package:cutaway/model/user.dart';

class UserProvider with ChangeNotifier {
  List<User> _users = [];
  final client = HttpClient();
  final apiClient = ApiClient();

  List<User> get users {
    return [..._users];
  }

  Future<void> reloadUser() async {
    final users = await apiClient.getUser();
    _users += users;
    notifyListeners();
  }

  User findById(int id) {
    return _users.firstWhere((user) => user.id == id);
  }
}
