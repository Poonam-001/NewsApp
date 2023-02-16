import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:news_app/user_info_model.dart';
import 'package:http/http.dart' as http;

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<UserInfoModel> listdata = [];

  Future apicall() async {
    http.Response data =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (data.statusCode == 200) {
      final decodedData = jsonDecode(data.body);

      for (int i = 0; i < decodedData.length; i++) {
        UserInfoModel userinfomodel = UserInfoModel.fromJson(decodedData[i]);
        listdata.add(userinfomodel);
      }
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
        body: ListView.separated(
      itemCount: listdata.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        UserInfoModel userInfo = listdata[index];
        return UserInfoCard(userinfo: userInfo);
      },
    ));
  }
}

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({super.key, required this.userinfo});

  final UserInfoModel userinfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(userinfo.id.toString()),
        Text(userinfo.name.toString()),
        Text(userinfo.username.toString()),
        Text(userinfo.email.toString()),
        Text(userinfo.address.street.toString()),
        Text(userinfo.address.suite.toString()),
        Text(userinfo.address.city.toString()),
        Text(userinfo.address.zipcode.toString()),
        Text(userinfo.address.geo.lat.toString()),
        Text(userinfo.address.geo.lng.toString()),
        Text(userinfo.phone.toString()),
        Text(userinfo.website.toString()),
        Text(userinfo.company.name.toString()),
        Text(userinfo.company.catchPhrase.toString()),
        Text(userinfo.company.bs.toString()),
      ],
    );
  }
}
