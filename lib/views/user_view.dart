import 'package:flutter/material.dart';

import '../models/user.dart';
import '../services/user_service.dart';

class UserView extends StatefulWidget {
  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  final _userService = UserService();
  late Future<User> _futureUser;

  @override
  void initState() {
    _futureUser = _userService.getUser();
    super.initState();
  }

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      appBar: AppBar(
        title: Text(
          'User Example',
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: FutureBuilder<User>(
          future: _futureUser,
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            if (snapshot.hasData) {
              return Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  leading: Text(
                    'Id: ${snapshot.data?.id}',
                  ),
                  title: Text(
                    'Title: ${snapshot.data?.name} ${snapshot.data?.username}',
                  ),
                  subtitle: Text(
                    'Email: ${snapshot.data?.email}',
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserViewDetail(user: snapshot.data!),
                        fullscreenDialog: true,
                      ),
                    );
                  },
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

class UserViewDetail extends StatelessWidget {
  const UserViewDetail({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      appBar: AppBar(
        title: Text('User Detail'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: ListView(
          children: [
            ListTile(
              title: Text('Id: ${user.id}'),
            ),
            ListTile(
              title: Text('Name: ${user.name}'),
            ),
            ListTile(
              title: Text('Username: ${user.username}'),
            ),
            ListTile(
              title: Text('Email: ${user.email}'),
            ),
            ListTile(
              title: Text('Adress - Street: ${user.address?.street}'),
            ),
            ListTile(
              title: Text('Adress - Suite: ${user.address?.suite}'),
            ),
            ListTile(
              title: Text('Adress - City: ${user.address?.city}'),
            ),
            ListTile(
              title: Text('Adress - Zipcode: ${user.address?.zipcode}'),
            ),
            ListTile(
              title: Text('Adress - Geo - Lat: ${user.address?.geo?.lat}'),
            ),
            ListTile(
              title: Text('Adress - Geo - Lng: ${user.address?.geo?.lng}'),
            ),
            ListTile(
              title: Text('Phone: ${user.phone}'),
            ),
            ListTile(
              title: Text('Website: ${user.website}'),
            ),
            ListTile(
              title: Text('Company - Name: ${user.company?.name}'),
            ),
            ListTile(
              title: Text('Company - CatchPhrase: ${user.company?.catchPhrase}'),
            ),
            ListTile(
              title: Text('Company - Bs: ${user.company?.bs}'),
            ),
          ],
        ),
      ),
    );
  }
}
