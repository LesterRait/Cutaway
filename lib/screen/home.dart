import 'package:flutter/material.dart';
import 'package:cutaway/client/ApiClient.dart';
import 'package:cutaway/provider/provider.dart';
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

// reload

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
}
