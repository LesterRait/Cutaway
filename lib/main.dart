import 'package:flutter/material.dart';
import 'package:cutaway/provider/albums.dart';
import 'package:cutaway/provider/photos.dart';
import 'package:cutaway/provider/posts.dart';
import 'package:cutaway/provider/users.dart';
import 'package:cutaway/screen/cutaway_detail.dart';
import 'package:cutaway/screen/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PostProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AlbumProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PhotoProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cutaway',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: const HomeScreen(),
        routes: {
          CutawayDetailScreen.routeName: (context) =>
              const CutawayDetailScreen(),
        },
      ),
    );
  }
}
