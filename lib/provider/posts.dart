import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cutaway/client/ApiClient.dart';
import 'package:cutaway/model/post.dart';

class PostProvider with ChangeNotifier {
  List<Post> _posts = [];
  final client = HttpClient();
  final apiClient = ApiClient();

  List<Post> get posts {
    return [..._posts];
  }

  Future<void> reloadPosts() async {
    final posts = await apiClient.getPost();
    _posts += posts;
    notifyListeners();
  }

  Post findByUserId(int id) {
    return _posts.firstWhere((post) => post.userId == id);
  }
}
