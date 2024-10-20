import 'package:calorias_diaria/modules/articules/controller/articles_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticlesPage extends GetView<ArticlesController> {
  const ArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Artigos'),
      ),
      body: Column(
        children: [
          Expanded(
            child: controller.obx(
              (state) => ListView.builder(
                itemCount: state?.length,
                itemBuilder: (context, index) {
                  final article = state![index];
                  return Card(
                    child: ListTile(
                      tileColor: Colors.white,
                      title: Text(article.title),
                      subtitle: Text(article.author),
                      trailing: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.network(
                          article.imageUrl,
                          errorBuilder: (context, error, stackTrace) {
                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                      onTap: () {
                        controller.openArticle(article);
                      },
                    ),
                  );
                },
              ),
              onLoading: const Center(child: CircularProgressIndicator()),
              onError: (error) => Center(child: Text(error!)),
            ),
          ),
        ],
      ),
    );
  }
}
