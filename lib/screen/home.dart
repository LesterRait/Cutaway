import 'package:flutter/material.dart';
import 'package:cutaway/client/ApiClient.dart';
import 'package:cutaway/provider/albums.dart';
import 'package:cutaway/provider/photos.dart';
import 'package:cutaway/provider/posts.dart';
import 'package:cutaway/provider/users.dart';
import 'package:cutaway/widget/card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final apiClient = ApiClient();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Provider.of<UserProvider>(context).reloadUser().then(
          (value) => setState(
            () {
              isLoading = false;
            },
          ),
        );
    Provider.of<PostProvider>(context).reloadPosts();
    Provider.of<AlbumProvider>(context).reloadAlbum();
    Provider.of<PhotoProvider>(context).reloadPhoto();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cutaway'),
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemCount: user.users.length,
                itemBuilder: (context, i) {
                  return CardWidget(
                    name: user.users[i].name,
                    surname: user.users[i].username,
                    id: user.users[i].id,
                  );
                },
              ),
      ),
    );
  }
}
