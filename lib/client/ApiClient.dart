import 'dart:io';
import 'dart:convert';

import 'package:cutaway/model/album.dart';
import 'package:cutaway/model/photo.dart';
import 'package:cutaway/model/post.dart';
import 'package:cutaway/model/user.dart';

class ApiClient {
  final client = HttpClient();

// User

  Future<List<User>> getUser() async {
    final json = await get(
      'https://jsonplaceholder.typicode.com/users',
    ) as List<dynamic>;

    final users = json
        .map((dynamic e) => User.fromJson(e as Map<String, dynamic>))
        .toList();
    return users;
  }

// Post

  Future<List<Post>> getPost() async {
    final json = await get(
      'https://jsonplaceholder.typicode.com/posts',
    ) as List<dynamic>;

    final posts = json
        .map((dynamic e) => Post.fromJson(e as Map<String, dynamic>))
        .toList();
    return posts;
  }

// Album

  Future<List<Album>> getAlbum() async {
    final json = await get(
      'https://jsonplaceholder.typicode.com/albums',
    ) as List<dynamic>;

    final albums = json
        .map((dynamic e) => Album.fromJson(e as Map<String, dynamic>))
        .toList();
    return albums;
  }

  // Photo
  Future<List<Photo>> getPhoto() async {
    final json = await get(
      'https://jsonplaceholder.typicode.com/photos',
    ) as List<dynamic>;

    final photos = json
        .map((dynamic e) => Photo.fromJson(e as Map<String, dynamic>))
        .toList();
    return photos;
  }

// GET

  Future<dynamic> get(String ulr) async {
    final url = Uri.parse(ulr);
    final request = await client.getUrl(url);
    final response = await request.close();
    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();
    final dynamic json = jsonDecode(jsonString);

    return json;
  }
}
