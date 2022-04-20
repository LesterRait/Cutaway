import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cutaway/client/ApiClient.dart';
import 'package:cutaway/model/photo.dart';

class PhotoProvider with ChangeNotifier {
  List<Photo> _photos = [];
  final client = HttpClient();
  final apiClient = ApiClient();

  List<Photo> get usphotosers {
    return [..._photos];
  }

  Future<void> reloadPhoto() async {
    final photos = await apiClient.getPhoto();
    _photos += photos;
    notifyListeners();
  }

  Photo findByPhotoId(int id) {
    return _photos.firstWhere((photos) => photos.id == id);
  }
}
