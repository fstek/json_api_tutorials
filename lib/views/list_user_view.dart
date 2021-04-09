import 'package:flutter/material.dart';

import '../models/user.dart';
import '../services/list_user_service.dart';

class ListUserView extends StatefulWidget {
  @override
  _ListUserViewState createState() => _ListUserViewState();
}

class _ListUserViewState extends State<ListUserView> {
  final _listUserService = ListUserService();
  late Future<List<User>> _futureListUser;

  @override
  void initState() {
    _futureListUser = _listUserService.getListUser();
    super.initState();
  }

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      appBar: AppBar(
        title: Text(
          'List User Example',
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: FutureBuilder<List<User>>(
          future: _futureListUser,
          builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
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
                        'Id: ${snapshot.data?[index].id}',
                      ),
                      title: Text(
                        'Title: ${snapshot.data?[index].name} ${snapshot.data?[index].username}',
                      ),
                      subtitle: Text(
                        'Email: ${snapshot.data?[index].email}',
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListUserViewDetail(
                              user: snapshot.data![index],
                            ),
                            fullscreenDialog: true,
                          ),
                        );
                      },
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

class ListUserViewDetail extends StatelessWidget {
  const ListUserViewDetail({Key? key, required this.user}) : super(key: key);

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
