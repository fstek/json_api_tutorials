import 'package:flutter/material.dart';

import '../models/post.dart';
import '../services/post_service.dart';

class PostView extends StatefulWidget {
  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  final _postService = PostService();
  late Future<Post> _futurePost;

  @override
  void initState() {
    _futurePost = _postService.getPost();
    super.initState();
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Post Example',
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: FutureBuilder<Post>(
          future: _futurePost,
          builder: (BuildContext context, AsyncSnapshot<Post> snapshot) {
            if (snapshot.hasData) {
              return Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  leading: Text(
                    'User Id: ${snapshot.data?.userId}',
                  ),
                  title: Text(
                    'Title: ${snapshot.data?.title}',
                  ),
                  isThreeLine: true,
                  subtitle: Text(
                    'Body: ${snapshot.data?.body}',
                  ),
                  trailing: Text(
                    'Id: ${snapshot.data?.id}',
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text(
                '${snapshot.error}',
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
