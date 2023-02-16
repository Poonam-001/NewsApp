import 'package:flutter/material.dart';
import 'package:news_app/news_application/article_model.dart';
import 'package:news_app/news_application/button.dart';
import 'package:news_app/news_application/web_view_page.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.articlesinfo,
  });
  final ArticleModel articlesinfo;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  void toggleReadMore() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            WebViewPage(url: widget.articlesinfo.url.toString())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            widget.articlesinfo.urlToImage != null
                ? Image.network(
                    widget.articlesinfo.urlToImage.toString(),
                    fit: BoxFit.contain,
                    width: double.infinity,
                  )
                : const SizedBox(),
            const SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Title: ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Flexible(
                  child: widget.articlesinfo.title != null
                      ? Text(
                          widget.articlesinfo.title.toString(),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        )
                      : const Text(""),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Description: ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Flexible(
                  child: widget.articlesinfo.description != null
                      ? Text(
                          widget.articlesinfo.description.toString(),
                          style: const TextStyle(fontSize: 16),
                        )
                      : const Text(""),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Content: ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Flexible(
                  child: widget.articlesinfo.content != null
                      ? Text(
                          widget.articlesinfo.content.toString(),
                          style: const TextStyle(fontSize: 16),
                        )
                      : const Text("Content not available."),
                ),
              ],
            ),
            Visibility(
              visible: (widget.articlesinfo.content?.length ?? 0) > 0,
              child: Button(
                onPressed: toggleReadMore,
                text: "Readmore ",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
