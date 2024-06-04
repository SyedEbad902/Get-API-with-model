import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice_app/model/post_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<PostModel> data = [];

class _HomePageState extends State<HomePage> {
  Future<List<PostModel>> getApi() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);
    // print(responseBody);
    for (var eachMap in responseBody) {
      data.add(PostModel.fromJson(eachMap));
    }
    return data;
  }

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getApi();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Users"),
          toolbarHeight: 60,
          backgroundColor: const Color.fromARGB(255, 148, 98, 235),
        ),
        body: FutureBuilder(
            future: getApi(),
            builder: (context, snapshot) {
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          snapshot.data?[index].id.toString() ?? "No data"),
                      subtitle: Text(
                          snapshot.data?[index].body.toString() ?? "No data"),
                    );
                  });
            }),
      ),
    );
  }
}
