import 'package:flutter/material.dart';
import 'package:news_app/news_application/article_model.dart';
import 'package:news_app/news_application/detail_page.dart';

class DataCard extends StatelessWidget {
  const DataCard({super.key, required this.articlesinfo});

  final ArticleModel articlesinfo;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(
                      articlesinfo: articlesinfo,
                    )));
      },
      child: Row(
        children: [
          articlesinfo.urlToImage != null
              ? Image.network(
                  articlesinfo.urlToImage!,
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width / 3,
                  height: 100,
                )
              : const SizedBox(),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    articlesinfo.source.name.toString(),
                    style: const TextStyle(
                      fontFamily: "poppins",
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    articlesinfo.title.toString(),
                    style: const TextStyle(
                      fontFamily: "poppins",
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
