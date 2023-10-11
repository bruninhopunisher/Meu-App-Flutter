import 'package:flutter/material.dart';
import 'package:meuprimeiroapp/model/comment_model.dart';
import 'package:meuprimeiroapp/repository/http/comments_repository.dart';
import 'package:meuprimeiroapp/shared/widget/progress_indicator_page.dart';

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
  var commentsRepository = CommentsHTTPRepository();
  var comments = <CommentsModel>[];

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    comments = await commentsRepository.getComentarios(widget.postId);
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
