import 'dart:convert';

import 'package:meuprimeiroapp/model/comment_model.dart';
import 'package:http/http.dart' as http;

class CommentsHTTPRepository {
  Future<List<CommentsModel>> getComentarios(int postId) async {
    var response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/posts/$postId/comments'));
    if (response.statusCode == 200) {
      var jsonPosts = jsonDecode(response.body);
      return (jsonPosts as List).map((e) => CommentsModel.fromJson(e)).toList();
    }
    return [];
  }
}
