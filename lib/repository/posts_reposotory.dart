import 'package:meuprimeiroapp/model/post_model.dart';

abstract class PostsRepository {
  Future<List<PostModel>> getPosts();
}
