import 'package:flutter/material.dart';
import 'package:meuprimeiroapp/repository/image_repository.dart';
import 'package:meuprimeiroapp/shared/widget/progress_indicator_page.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  final ImageRepository imageRepository = ImageRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF820AD1),
      body: FutureBuilder<List<Map<String, String>>>(
        future: imageRepository.getImagens(),
        builder: (context, AsyncSnapshot<List<Map<String, String>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: ProgressIndicatorPage());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar imagens.'));
          } else {
            List<Map<String, String>> imagens = snapshot.data!;
            return ListView.builder(
              itemCount: imagens.length,
              itemBuilder: (context, index) {
                Map<String, String> imagemInfo = imagens[index];
                return Card(
                  color: Colors.white,
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    child: ListTile(
                      minVerticalPadding: 20,
                      title: Text(imagemInfo["descricao"]!),
                      contentPadding: const EdgeInsets.all(40),
                      leading: SizedBox(
                        width: 120,
                        height: 120,
                        child: Image.asset(
                          imagemInfo["caminho"]!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
