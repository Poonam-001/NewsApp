import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/app_sizes.dart';
import 'package:news_app/news_application/article_model.dart';
import 'package:news_app/news_application/data_card.dart';
import 'package:news_app/news_application/news_card.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<ArticleModel> listData = [];

  Future apicall() async {
    try {
      http.Response data = await http.get(Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=us&apiKey=5a78d93594214dc59888aca5130e9deb"));
      if (data.statusCode == 200) {
        final decodedData = jsonDecode(data.body);
        List articles = decodedData['articles'];
        for (int i = 0; i < articles.length; i++) {
          if (articles[i] != null) {
            ArticleModel article = ArticleModel.fromJson(articles[i]);
            listData.add(article);
          }
        }
        setState(() {});
      } else {
        debugPrint("Request failed with status: ${data.statusCode}");
      }
    } catch (error) {
      debugPrint("Request failed with error: $error");
    }
  }

  @override
  void initState() {
    apicall();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: const Color(0xffF8EEE2),
            pinned: false,
            floating: true,
            snap: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Fw",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: "poppins",
                      color: Color(0xFF1F5753),
                    ),
                  ),
                  Text(
                    "News",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: "poppins",
                      color: Color(0xFF403B36),
                    ),
                  ),
                ],
              ),
              centerTitle: true,
            ),
          ),
          const SliverSizedBox(height: AppSizes.s10),
          const SliverToBoxAdapter(child: TopHeadlines()),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                physics: const BouncingScrollPhysics(),
                itemCount: listData.length,
                itemBuilder: (BuildContext context, int index) {
                  ArticleModel article = listData[index];
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: NewsCard(
                      articledata: article,
                    ),
                  );
                },
              ),
            ),
          ),
          const SliverToBoxAdapter(child: MoreNews()),
          SliverPadding(
            padding: AppSizes.globalSymmetrixPadding,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  ArticleModel article = listData[index];
                  return DataCard(
                    articlesinfo: article,
                  );
                },
                childCount: listData.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopHeadlines extends StatelessWidget {
  const TopHeadlines({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSizes.globalSymmetrixPadding,
      child: Title(
        color: Colors.black,
        child: const Text(
          "Top Headlines",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: "poppins",
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class MoreNews extends StatelessWidget {
  const MoreNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSizes.globalSymmetrixPadding,
      child: Title(
        color: Colors.black,
        child: const Text(
          "More News",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: "poppins",
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class SliverSizedBox extends StatelessWidget {
  const SliverSizedBox({
    super.key,
    this.height,
    this.child,
    this.width,
  });

  final double? height;
  final Widget? child;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: SizedBox(
      height: height,
      width: width,
      child: child,
    ));
  }
}
