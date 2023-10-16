import 'package:flutter/material.dart';
import 'package:meuprimeiroapp/model/comment_model.dart';
import 'package:meuprimeiroapp/repository/comments/comments_repository.dart';
import 'package:meuprimeiroapp/repository/comments/impl/comments_dio_repository.dart';
import '../../widget/progress_indicator_page.dart';

class CommentsPage extends StatefulWidget {
  final int postId;
  const CommentsPage({
    super.key,
    required this.postId,
  });

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  late CommentsRepository commentsRepository;
  var comments = <CommentModel>[];

  @override
  void initState() {
    super.initState();
    commentsRepository = CommentsDioRepository();
    carregarDados();
  }

  carregarDados() async {
    comments = await commentsRepository.retornaComentarios(widget.postId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: comments.isEmpty
          ? const ProgressIndicatorPage()
          : CustomScrollView(
              slivers: [
                const SliverAppBar(
                  backgroundColor: Color(0xFF820AD1),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(20),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: ListTile(
                              title: Text(
                                comments[index].name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                comments[index].body,
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: comments.length,
                  ),
                ),
              ],
            ),
    );
  }
}
