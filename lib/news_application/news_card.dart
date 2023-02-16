import 'package:flutter/material.dart';
import 'package:news_app/app_sizes.dart';
import 'package:news_app/news_application/article_model.dart';
import 'package:news_app/news_application/detail_page.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.articledata});

  final ArticleModel articledata;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(
                      articlesinfo: articledata,
                    )));
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            articledata.urlToImage != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(AppSizes.s10),
                    child: Image.network(
                      articledata.urlToImage!,
                      fit: BoxFit.cover,
                      height: 150,
                      width: double.infinity,
                    ),
                  )
                : const SizedBox(),
            const SizedBox(height: AppSizes.s10),
            Flexible(
              child: Text(
                articledata.title.toString(),
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontFamily: "poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
