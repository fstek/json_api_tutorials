import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user.dart';

class UserService {
  final _baseUrl = 'https://jsonplaceholder.typicode.com';
  final _endPointUser = 'users/1';

  Future<User> getUser() async {
    final _url = Uri.parse('$_baseUrl/$_endPointUser');

    final response = await http.get(_url);

    if (response.statusCode == 200) {
      /// JSON Object To String
      final _jsonBody = response.body;

      /// String To Map
      final _decodedBody = jsonDecode(_jsonBody) as Map<String, dynamic>;
      //final Map<String, dynamic> _decodedBody = jsonDecode(_jsonBody);

      /// JSON (Map) To Dart (Object)
      final _postResponse = User.fromJson(_decodedBody);

      /// Response: Dart Object
      return _postResponse;
    } else {
      throw Exception(
        'Veriler Alınamadı.Hata kodu: ${response.statusCode}',
      );
    }
  }
}
