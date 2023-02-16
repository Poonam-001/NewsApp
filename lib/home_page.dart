import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UserModel> listData = [];
  bool isLoading = false;

  Future apicall() async {
    isLoading = true;
    http.Response data =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (data.statusCode == 200) {
      final recievedData = jsonDecode(data.body);

      for (int i = 0; i < recievedData.length; i++) {
        UserModel model = UserModel.fromJson(recievedData[i]);
        listData.add(model);
      }

      // await Future.delayed(const Duration(seconds: 1));

      isLoading = false;

      setState(() {});
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
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemCount: listData.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (BuildContext context, int index) {
                UserModel userModel = listData[index];
                return UserCard(userModel: userModel);
              },
            ),
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.userModel});

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Image.asset(
            'assets/image.png',
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userModel.userId.toString()),
                  Text(userModel.id.toString()),
                  Text(userModel.title.toString()),
                  Text(userModel.body.toString()),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
