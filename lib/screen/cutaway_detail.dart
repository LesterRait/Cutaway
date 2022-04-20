import 'package:flutter/material.dart';
import 'package:cutaway/provider/albums.dart';
import 'package:cutaway/provider/photos.dart';
import 'package:cutaway/provider/posts.dart';
import 'package:cutaway/provider/users.dart';
import 'package:cutaway/widget/info.dart';
import 'package:cutaway/widget/post.dart';
import 'package:provider/provider.dart';

class CutawayDetailScreen extends StatelessWidget {
  static const routeName = '/cutway-detail';
  const CutawayDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Provider
    final userId = ModalRoute.of(context)!.settings.arguments as int;
    final user =
        Provider.of<UserProvider>(context, listen: false).findById(userId);
    final posts =
        Provider.of<PostProvider>(context, listen: false).findByUserId(userId);
    // final albums = Provider.of<AlbumProvider>(context, listen: false)
    //     .findByAlbumId(userId);
    // final photos = Provider.of<PhotoProvider>(context, listen: false)
    //     .findByPhotoId(userId);

    return Scaffold(
      appBar: AppBar(
        title: Text(user.username),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            InfoWidget(user: user),
            const Divider(
              color: Colors.black,
            ),
            const Text(
              'Posts',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            PostWidget(posts: posts),
            const SizedBox(height: 10),
            const Text('Albums',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
            // Text(albums.title),
            // const SizedBox(height: 10),
            // // Image.network(photos.url),
            // Image.network(photos.thumbnailUrl),
          ],
        ),
      ),
    );
  }
}
