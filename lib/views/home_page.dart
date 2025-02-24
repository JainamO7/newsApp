import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/news_controller.dart';
import 'detail_page.dart';
import '../widgets/shimmer_loading.dart';

class HomePage extends StatelessWidget {
  final NewsController controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News App')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search news...',
                border: OutlineInputBorder(),
              ),
              onChanged: controller.searchArticles,
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return ListView.builder(
                  itemCount: 5,
                  itemBuilder: (_, __) => ShimmerLoading(),
                );
              }
              if (controller.filteredArticles.isEmpty) {
                return const Center(child: Text('No articles found'));
              }
              return ListView.builder(
                itemCount: controller.filteredArticles.length,
                itemBuilder: (context, index) {
                  final article = controller.filteredArticles[index];
                  return Dismissible(
                    key: Key(article.url),
                    onDismissed: (_) {
                      controller.filteredArticles.remove(article);
                      Get.snackbar('Dismissed', '${article.title} removed');
                    },
                    background: Container(color: Colors.red),
                    child: ListTile(
                      leading: article.urlToImage != null
                          ? Hero(
                              tag: article.url,
                              child: CachedNetworkImage(
                                imageUrl: article.urlToImage!,
                                width: 50,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.broken_image),
                              ),
                            )
                          : const SizedBox(width: 50, child: Icon(Icons.image)),
                      title: Text(article.title),
                      subtitle: Text(article.source?.name ?? 'Unknown'),
                      onTap: () => Get.to(() => DetailPage(article: article)),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}