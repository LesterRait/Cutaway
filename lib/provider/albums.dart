import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cutaway/client/ApiClient.dart';
import 'package:cutaway/model/album.dart';

class AlbumProvider with ChangeNotifier {
  List<Album> _albums = [];
  final client = HttpClient();
  final apiClient = ApiClient();

  List<Album> get photos {
    return [..._albums];
  }

  Future<void> reloadAlbum() async {
    final albums = await apiClient.getAlbum();
    _albums += albums;
    notifyListeners();
  }

  Album findByAlbumId(int id) {
    return _albums.firstWhere((albums) => albums.id == id);
  }
}
