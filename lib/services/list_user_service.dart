import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user.dart';

class ListUserService {
  final _baseUrl = 'https://jsonplaceholder.typicode.com';
  final _endPointListUser = 'users';

  Future<List<User>> getListUser() async {
    final _url = Uri.parse('$_baseUrl/$_endPointListUser');

    final response = await http.get(_url);

    if (response.statusCode == 200) {
      /// JSON Object To String
      final _jsonBody = response.body;

      /// String To Map
      final _decodedBody = jsonDecode(_jsonBody);

      /// JSON (List) To Dart (Object)
      final _listUserResponse = List<User>.from(_decodedBody.map((x) => User.fromJson(x)));

      /// Response: Dart Object
      return _listUserResponse;
    } else {
      throw Exception(
        'Veriler Alınamadı.Hata kodu: ${response.statusCode}',
      );
    }
  }
}
