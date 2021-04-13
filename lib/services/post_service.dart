import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/post.dart';

class PostService {
  final _baseUrl = 'https://jsonplaceholder.typicode.com';
  final _endPointUser = 'posts/1';

  Future<Post> getPost() async {
    final _url = Uri.parse('$_baseUrl/$_endPointUser');

    final response = await http.get(_url);

    if (response.statusCode == 200) {
      /// JSON Object To String
      final _jsonBody = response.body;

      /// String To Map
      final _decodedBody = jsonDecode(_jsonBody) as Map<String, dynamic>;

      /// JSON (Map) To Dart (Object)
      final _postResponse = Post.fromJson(_decodedBody);

      /// Response: Dart Object
      return _postResponse;
    } else {
      throw Exception(
        'Veriler Alınamadı.Hata kodu: ${response.statusCode}',
      );
    }
  }

  Future<Post> getPostPut() async {
    final _url = Uri.parse('$_baseUrl/$_endPointUser');
    final _body = <String, int>{'userId': 999, 'id': 999};
    final _headers = <String, String>{'Content-Type': 'application/json; charset=UTF-8'};

    final response = await http.put(
      _url,
      body: jsonEncode(_body),
      headers: _headers,
    );

    if (response.statusCode == 200) {
      /// JSON Object To String
      final _jsonBody = response.body;
      print(_jsonBody);

      /// String To Map
      final _decodedBody = jsonDecode(_jsonBody) as Map<String, dynamic>;

      /// JSON (Map) To Dart (Object)
      final _postResponse = Post.fromJson(_decodedBody);
      print('${_postResponse.id} ${_postResponse.userId} ');

      /// Response: Dart Object
      return _postResponse;
    } else {
      throw Exception(
        'Veriler Alınamadı.Hata kodu: ${response.statusCode}',
      );
    }
  }
}
