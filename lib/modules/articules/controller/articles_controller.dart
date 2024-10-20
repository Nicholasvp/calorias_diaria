import 'package:calorias_diaria/core/enums/enums.dart';
import 'package:calorias_diaria/core/models/articule_model.dart';
import 'package:calorias_diaria/core/service/api_service.dart';
import 'package:calorias_diaria/core/widgets/buttons/button_primary.dart';
import 'package:calorias_diaria/core/widgets/cards/tag_card.dart';
import 'package:calorias_diaria/modules/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticlesController extends GetxController with StateMixin<List<ArticleModel>> {
  final apiService = Get.find<ApiService>();

  @override
  void onReady() async {
    await getAll();
    super.onReady();
  }

  Future<void> getAll() async {
    change(null, status: RxStatus.loading());
    final response = await apiService.getAll();
    final Map<String, dynamic> data = response?.data;
    if (response != null) {
      final List<ArticleModel> articles = List<ArticleModel>.from(data['articles'].map((x) => ArticleModel.fromMap(x)));

      final profile = Get.find<ProfileController>().state;
      List<ArticleModel> articlesFiltered = articles;
      if (profile?.objetivo != null && profile?.objetivo != '') {
        articlesFiltered = articles.where((element) => objetivoTranslateMap[element.goal] == profile?.objetivo).toList();
      }
      change(articlesFiltered, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error('Error ao carregar artigos, verifique sua conexão com a internet'));
    }
  }

  void openArticle(ArticleModel article) {
    Get.bottomSheet(
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Image.network(
                article.imageUrl,
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox.shrink();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(
                      article.title,
                    ),
                    subtitle: Text(article.author),
                    contentPadding: EdgeInsets.zero,
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: article.tags.map((tag) {
                      return TagCard(tag: tag);
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  Text(article.content),
                  const SizedBox(height: 20),
                  ButtonPrimary(
                    label: 'FECHAR',
                    onPressed: () => Get.back(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
      persistent: false,
      backgroundColor: Colors.white,
    );
  }
}
