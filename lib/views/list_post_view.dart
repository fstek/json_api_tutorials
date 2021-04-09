import 'package:flutter/material.dart';

import '../models/post.dart';
import '../services/list_post_service.dart';

class ListPostView extends StatefulWidget {
  @override
  _ListPostViewState createState() => _ListPostViewState();
}

class _ListPostViewState extends State<ListPostView> {
  final _listPostsService = ListPostService();
  late Future<List<Post>> _futureListPost;

  @override
  void initState() {
    _futureListPost = _listPostsService.getListPost();
    super.initState();
  }

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Color(0xffe0e0e0),
      appBar: AppBar(
        title: Text(
          'List Post Example',
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: FutureBuilder<List<Post>>(
          future: _futureListPost,
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: EdgeInsets.all(10),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      leading: Text(
                        'User Id: ${snapshot.data?[index].userId}',
                      ),
                      title: Text(
                        'Title: ${snapshot.data?[index].title}',
                      ),
                      isThreeLine: true,
                      subtitle: Text(
                        'Body: ${snapshot.data?[index].body}',
                      ),
                      trailing: Text(
                        'Id: ${snapshot.data?[index].id}',
                      ),
                    ),
                  );
                },
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
