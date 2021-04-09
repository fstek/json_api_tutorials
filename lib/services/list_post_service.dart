import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/post.dart';

class ListPostService {
  final _baseUrl = 'https://jsonplaceholder.typicode.com';
  final _endPointListPost = 'posts';

  Future<List<Post>> getListPost() async {
    final _url = Uri.parse('$_baseUrl/$_endPointListPost');

    final response = await http.get(_url);

    if (response.statusCode == 200) {
      /// JSON Object To String
      final _jsonBody = response.body;

      /// String To Map
      final _decodedBody = jsonDecode(_jsonBody);

      /// JSON (List) To Dart (Object)
      final _listPostResponse = List<Post>.from(_decodedBody.map((x) => Post.fromJson(x)));

      /// Response: Dart Object
      return _listPostResponse;
    } else {
      throw Exception(
        'Veriler Alınamadı.Hata kodu: ${response.statusCode}',
      );
    }
  }
}
