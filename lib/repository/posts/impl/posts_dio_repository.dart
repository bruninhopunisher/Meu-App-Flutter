import 'package:meuprimeiroapp/model/post_model.dart';
import 'package:meuprimeiroapp/repository/jsonplaceholder_custom_dio.dart';

import 'posts_http_repository.dart';

class PostDioRepository implements PostsHTTPRepository {
  @override
  Future<List<PostModel>> getPosts() async {
    var jsonPlaceHolderCustomDio = JsonPlaceHolderCustomDio();
    var response = await jsonPlaceHolderCustomDio.dio
        .get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200) {
      return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
