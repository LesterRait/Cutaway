import 'package:flutter/material.dart';
import 'package:cutaway/model/post.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    Key? key,
    required this.posts,
  }) : super(key: key);

  final Post posts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          posts.title,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          posts.body,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
