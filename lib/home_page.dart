import 'package:flutter/material.dart';

import 'views/post_view.dart';
import 'views/user_view.dart';
import 'views/list_post_view.dart';
import 'views/list_user_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        title: Text(
          'HTTP Request Metot',
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Divider(color: Colors.black),
            ListTile(
              title: Text('Request Metot: GET'),
              isThreeLine: true,
              subtitle: Text(
                'Endpoint: /posts/1 \nResponse: JSONObject {} \nJSONPlaceholder',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostView(),
                    fullscreenDialog: true,
                  ),
                );
              },
            ),
            Divider(color: Colors.black),
            ListTile(
              title: Text('Request Metot: GET'),
              isThreeLine: true,
              subtitle: Text(
                'Endpoint: /posts \nResponse: JSONArray [] \nJSONPlaceholder',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListPostView(),
                    fullscreenDialog: true,
                  ),
                );
              },
            ),
            Divider(color: Colors.black),
            ListTile(
              title: Text('Request Metot: GET'),
              isThreeLine: true,
              subtitle: Text(
                'Endpoint: /users/1 \nResponse: JSONObject {} \nJSONPlaceholder',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserView(),
                  ),
                );
              },
            ),
            Divider(color: Colors.black),
            ListTile(
              title: Text('Request Metot: GET'),
              isThreeLine: true,
              subtitle: Text(
                'Endpoint: /users \nResponse: JSONArray [] \nJSONPlaceholder',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListUserView(),
                  ),
                );
              },
            ),
            Divider(color: Colors.black),
          ],
        ),
      ),
    );
  }
}
